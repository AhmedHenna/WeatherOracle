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
    var offset: Int
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
                        ForecastCard(dayTime: currentTime, sunset: sunset, sunrise: sunrise, offset: offset,
                                     forecast: forecast, forecastPeriod: .hourly,
                                     firstEntry: hourlyData.first?.date ?? Date())
                    }
                    .transition(.offset(x: -430))
                } else {
                    ForEach(dailyData) { forecast in
                        ForecastCard(dayTime: currentTime, sunset: sunset, sunrise: sunrise, offset: offset,
                                     forecast: forecast, forecastPeriod: .daily,
                                     firstEntry: dailyData.first?.date ?? Date())
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
            AirQualityCard(aqiValue: widgetData?.aqi ?? 0)
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]){
                FeelsLikeCard(feelsLikeTemp: Int(round(widgetData?.feelsLike ?? 0)),
                              actualTemp: Int(round(widgetData?.actualTemp ?? 0)))
                
                UVIndexCard(uviValue:  Int(round(widgetData?.uviValue ?? 0)),
                            startTime: widgetData?.uviStart ?? "",
                            endTime: widgetData?.uviEnd ?? "")
                
                HumidityCard(humidity: widgetData?.humidity ?? 0,
                             dewPoint: Int(round(widgetData?.dewPoint ?? 0.0)))
                
                WindCard(speed: widgetData?.windSpeed ?? 0.0,
                         direction: CGFloat(widgetData?.windDirection ?? 0))
                
                PressureCard(pressure: widgetData?.pressure ?? 0)
                
                RainfallCard(currentRainfall: widgetData?.currentRainfall ?? Precipitation(value: 0),
                             expectedRainfall24H: widgetData?.expectedRainfall ?? 0.0)
            
                VisibilityCard(visibileMeters: widgetData?.visibility ?? 0,
                               weatehrState: widgetData?.visibilityDescription ?? "")
                
                SunriseSunsetCard(isSunrise: true, sunRise: widgetData?.sunRise ?? 0,
                                  sunSet: widgetData?.sunSet ?? 0,
                                  currentTime: widgetData?.currentTime ?? 0, offset: offset)
                
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
                     offset: 1,
                     hasDragged: .constant(false))
        .preferredColorScheme(.dark)
    }
}

