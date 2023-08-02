//
//  ForecastView.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/10/23.
//

import SwiftUI

struct ForecastView: View {
    var bottomSheetTranslationChanged: CGFloat = 1
    var hourlyData: [WeatherForcast]
    var dailyData: [WeatherForcast]
    var widgetData: WidgetForecast?
    var currentTime: Int
    var sunset: Int
    var sunrise: Int
    @State private var selection = 0
    @Binding var hasDragged: Bool
    
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
                    ForEach(hourlyData) { forecast in
                        ForecastCard(dayTime: currentTime, sunset: sunset, sunrise: sunrise, forecast: forecast, forecastPeriod: .hourly)
                    }
                    .transition(.offset(x: -430))
                } else {
                    ForEach(dailyData) { forecast in
                        ForecastCard(dayTime: currentTime, sunset: sunset, sunrise: sunrise, forecast: forecast, forecastPeriod: .daily)
                    }
                    .transition(.offset(x: 430))
                }
            }
            .padding(.vertical, 20)
        }
        .padding(.horizontal, 5)
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
            AirQualityCard(aqiValue: 75)
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]){
                FeelsLikeCard(feelsLikeTemp: Int(round(widgetData?.feelsLike ?? 0)),
                              actualTemp: Int(round(widgetData?.actualTemp ?? 0)))
                
                UVIndexCard(uviValue:  Int(round(widgetData?.uviValue ?? 0)),
                            startTime: widgetData?.uviStart ?? "",
                            endTime: widgetData?.uviEnd ?? "")
                
                HumidityCard(humidity: 83, dewPoint: 19)
                WindCard(speed: 9.7, direction: 240)
                PressureCard(pressure: 1000)
                RainfallCard(currentRainfall: 0.23, expectedRainfall24H: 0.05 )
                VisibilityCard(visibileMeters: 5000, weatehrState: "Fog")
                SunriseSunsetCard(isSunrise: true, sunRise: 1690950305, sunSet: 1691005706, currentTime: 1690983651)
                
            }
            
        }
        .padding(15)
    }
    
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(hourlyData: [],
                     dailyData: [],
                     widgetData: nil,
                     currentTime: 1,
                     sunset: 1,
                     sunrise: 1,
                     hasDragged: .constant(false))
        .preferredColorScheme(.dark)
    }
}

