//
//  HomeView.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/7/23.
//

import SwiftUI
import BottomSheet

struct HomeView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    @State var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    @State var hasDragged: Bool = false
    var bottomSheetTranslationChanged: CGFloat {
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) / (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }
    
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
                Color.linearBackgroundMorning
                    .ignoresSafeArea()
                
                Image("Home Morning")
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top, 324)
                    .offset(y: -bottomSheetTranslationChanged * imageOffset)
            }
        }
    }
    
    var currentWeather : some View{
        VStack(spacing: -10 * (1 - bottomSheetTranslationChanged)) {
            Text("Cairo")
                .font(.largeTitle)
                .foregroundColor(Color("Text Primary"))
            
            VStack {
                let layout = hasDragged ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
                
                layout{
                    HStack {
                        Text("27°")
                            .fontWeight(hasDragged ? .semibold : .thin)
                            .font(.system(size: (96 - (bottomSheetTranslationChanged * (96 - 20)))))
                        Text(" | ")
                            .font(.title3.weight(.semibold))
                            .foregroundColor(Color("Text Secondary").opacity(bottomSheetTranslationChanged))
                    }
                    .offset(x: !hasDragged ? 25 : 0)
                    
                    Text("Mostly Clear")
                        .font(.title3.weight(.semibold))
                        .foregroundColor(Color("Text Secondary"))
                }
                Text("H:36°   L:26°")
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
                ForecastView(bottomSheetTranslationChanged: bottomSheetTranslationChanged, hasDragged: $hasDragged)
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
        TabBar(action: {
            bottomSheetPosition = .top
        })
        .offset(y: bottomSheetTranslationChanged * 115)
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
