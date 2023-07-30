//
//  ForecastView.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/10/23.
//

import SwiftUI

struct ForecastView: View {
    var bottomSheetTranslationChanged: CGFloat = 1
    @State private var selection = 0
    @Binding var hasDragged: Bool
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Tabs(selection: $selection)
                forecastCards
                
                if hasDragged {
                    widgets
                }
            }
        }
        .backgroundBlur(radius: 25, opaque: true)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .overlay {
            bottomSheetSeperator
        }
        .overlay {
            dragIndicator
        }
    }
    
    var forecastCards : some View{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                if selection == 0 {
                    ForEach(viewModel.hourlyData) { forecast in
                        ForecastCard(forecast: forecast, forecastPeriod: .hourly)
                    }
                    .transition(.offset(x: -430))
                } else {
                    ForEach(viewModel.dailyData) { forecast in
                        ForecastCard(forecast: forecast, forecastPeriod: .daily)
                    }
                    .transition(.offset(x: 430))
                }
            }
            .padding(.vertical, 20)
        }
        .padding(.horizontal, 20)
    }
    
    var bottomSheetSeperator : some View{
        Divider()
            .blendMode(.overlay)
            .background(Color.linearHighlight)
            .frame(maxHeight: .infinity, alignment: .top)
            .clipShape(RoundedRectangle(cornerRadius: 44))
    }
    
    var dragIndicator : some View{
        RoundedRectangle(cornerRadius: 10)
            .fill(.black.opacity(0.3))
            .frame(width: 48, height: 5)
            .frame(height: 20)
            .frame(maxHeight: .infinity, alignment: .top)
    }
    
    var widgets : some View{
        VStack{
            AirQualityCard(aqiValue: 75, startTime: 9, endTime: 6)
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]){
                FeelsLikeCard(feelsLikeTemp: 55, actualTemp: 80)
                UVIndexCard(uviValue:  5  , startTime: 9, endTime: 6)
                HumidityCard(humidity: 83, dewPoint: 19)

                WindCard(speed: 9.7, direction: 240)

                PressureCard(pressure: 1000)
                RainfallCard(currentRainfall: 0.23, expectedRainfall24H: 0.05 )
                VisibilityCard(visibileMeters: 5000, weatehrState: "Fog")
                SunriseSunsetView(isSunrise: true, currentTime: "2:27 AM", sunTime: "9:14")

            }
            
        }
        .padding(15)
    }
    
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(hasDragged: .constant(false))
            .preferredColorScheme(.dark)
    }
}

