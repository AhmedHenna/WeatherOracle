//
//  HomeView.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/7/23.
//

import SwiftUI
import BottomSheet
import CoreLocation

struct HomeView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    @State var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    @State var hasDragged: Bool = false
    @State private var tabBarOffset: CGFloat = 0
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColorAndImageBasedOnTime
                currentWeather
                bottomSheet
                tabBarArea
            }
        }
        .navigationBarHidden(true)
    }
    
    var backgroundColorAndImageBasedOnTime : some View{
        GeometryReader { geometry in
            let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
            let imageOffset = screenHeight + 36
            Group{
                mapTimeToColor(time: viewModel.weatherData?.current?.dt ?? 1,
                               sunset: viewModel.weatherData?.current?.sunset ?? 1)
                .ignoresSafeArea()
                
                Image(mapTimeToImage(time: viewModel.weatherData?.current?.dt ?? 1,
                                     sunset: viewModel.weatherData?.current?.sunset ?? 1))
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 270)
                .offset(y: -bottomSheetTranslationChanged * imageOffset)
            }
        }
    }
    
    var currentWeather : some View{
        VStack(alignment: .center, spacing: -10 * (1 - bottomSheetTranslationChanged)) {
            let cityName = viewModel.weatherData?.timezone
            Text(cityName?.components(separatedBy: "/").last ?? "")
                .font(.largeTitle)
                .foregroundColor(Color("Text Primary"))
            
            VStack{
                let layout = hasDragged ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
                let currentTemp = String(Int(round(viewModel.weatherData?.current?.temp ?? 0)))
                let weatherDescription = String(viewModel.weatherData?.current?.weather?.first?.description ?? "")
                    .capitalized
                
                layout{
                    HStack {
                        Text(currentTemp)
                            .fontWeight(hasDragged ? .semibold : .thin)
                            .font(.system(size: (96 - (bottomSheetTranslationChanged * (96 - 20)))))
                        Text(" | ")
                            .font(.title3.weight(.semibold))
                            .foregroundColor(Color("Text Secondary").opacity(bottomSheetTranslationChanged))
                    }
                    .offset(x: !hasDragged ? 10 : 0)
                    
                    Text(weatherDescription)
                        .font(.title3.weight(.semibold))
                        .foregroundColor(Color("Text Secondary"))
                }
                
                let max = String(Int(round(viewModel.weatherData?.daily?.first?.temp?.max ?? 0)))
                let min = String(Int(round(viewModel.weatherData?.daily?.first?.temp?.min ?? 0)))
                
                Text("H:\(max)°   L:\(min)°")
                    .font(.title3.weight(.semibold))
                    .opacity(1 - bottomSheetTranslationChanged)
            }
            .foregroundColor(!hasDragged ? Color("Text Primary") : Color("Text Secondary"))
            
            Spacer()
        }
        .padding(.top, 51)
        .offset(y: -bottomSheetTranslationChanged * 46)
    }
    
    var bottomSheet : some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
            BottomSheetView(position: $bottomSheetPosition) {
            } content: {
                ForecastView(bottomSheetTranslationChanged: bottomSheetTranslationChanged,
                             hourlyData: viewModel.hourlyData,
                             dailyData: viewModel.dailyData,
                             dayTime: viewModel.weatherData?.current?.dt ?? 1,
                             sunset: viewModel.weatherData?.current?.sunset ?? 1,
                             hasDragged: $hasDragged)
                .foregroundColor(.white)
            }
            .onBottomSheetDrag { translation in
                bottomSheetTranslation = translation / screenHeight
                
                withAnimation(.easeInOut) {
                    if bottomSheetPosition == BottomSheetPosition.top {
                        hasDragged = true
                    } else {
                        hasDragged = false
                    }
                }
            }
        }
    }
    
    var tabBarArea : some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
            withAnimation(.easeOut){
                TabBar(action: {
                    bottomSheetPosition = .top
                })
                .offset(y: calculateTabBarOffset(screenHeight: screenHeight))
            }
        }
        .onChange(of: bottomSheetPosition, perform: { newValue in
            updateTabBarOffset()
        })
    }
    
    private func calculateTabBarOffset(screenHeight: CGFloat) -> CGFloat {
        let maxOffset: CGFloat = 115
        let newOffset = bottomSheetTranslationChanged * screenHeight
        tabBarOffset = min(newOffset, maxOffset)
        return tabBarOffset
    }
    
    private func updateTabBarOffset() {
        withAnimation {
            tabBarOffset = 0
        }
    }
    
    
    var bottomSheetTranslationChanged: CGFloat {
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) / (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }
}

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83
    case middle = 0.385
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
