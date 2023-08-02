//
//  Forecast.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/10/23.
//

import Foundation

struct Forecast: Identifiable {
    var id = UUID()
    var date: Date
    var weather: WeatherStuff
    var probability: Int
    var temperature: Int
    var high: Int
    var low: Int
    var location: String
    var icon: String
}

struct WeatherForcast: Identifiable {
    var id = UUID()
    var date: Date
    var temperature: Int
    var rainPercentage: Double
    var weatherID: Int
}

struct WidgetForecast : Identifiable {
    var id = UUID()
    var feelsLike: Double
    var currentRainfall: Precipitation
    var expectedRainfall: Double
    var dewPoint: Double
    var windSpeed: Double
    var uviValue: Double
    var aqi: Int
    var actualTemp: Int
    var uviStart: String
    var uviEnd: String
    var humidity: Int
    var windDirection: Int
    var pressure: Int
    var visibility: Int
    var sunRise: Int
    var sunSet: Int
    var currentTime: Int
    var isSunrise: Bool
    var visibilityDescription: String
}

extension Forecast {
    static let hour: TimeInterval = 60 * 60
    static let day: TimeInterval = 60 * 60 * 24
    
    
    
    static let cities: [Forecast] = [
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 19, high: 28, low: 22, location: "Cairo, Egypt", icon: "Sun"),
        Forecast(date: .now, weather: .clear, probability: 0, temperature: 20, high: 32, low: 19, location: "Dubai, UAE",icon: "Moon"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 13, high: 16, low: 8, location: "Toronto, Canada", icon: "Sun"),
        Forecast(date: .now, weather: .clear, probability: 0, temperature: 23, high: 28, low: 19, location: "Texas, United States", icon: "Moon")
    ]
}

