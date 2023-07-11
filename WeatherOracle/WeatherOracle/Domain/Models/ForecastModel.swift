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
    var weather: Weather
    var probability: Int
    var temperature: Int
    var high: Int
    var low: Int
    var location: String
    var icon: String
}

extension Forecast {
    static let hour: TimeInterval = 60 * 60
    static let day: TimeInterval = 60 * 60 * 24
    
    
    //The following is just testing data that will be removed later on when api is implemented
    static let hourly: [Forecast] = [
        Forecast(date: .init(timeIntervalSinceNow: hour * -1), weather: .sunny, probability: 30, temperature: 19, high: 24, low: 18, location: "Cairo, Egypt", icon: "Sun"),
        Forecast(date: .now, weather: .windy, probability: 0, temperature: 19, high: 24, low: 18, location: "Cairo, Egypt",icon: "Tornado"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 1), weather: .sunny, probability: 0, temperature: 19, high: 24, low: 18, location: "Cairo, Egypt",icon: "Sun"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 2), weather: .sunny, probability: 0, temperature: 18, high: 24, low: 18, location: "Cairo, Egypt",icon: "Sun"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 3), weather: .sunny, probability: 0, temperature: 19, high: 24, low: 18, location: "Cairo, Egypt",icon: "Sun"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 4), weather: .sunny, probability: 0, temperature: 19, high: 24, low: 18, location: "Cairo, Egypt",icon: "Sun")
    ]
    
    static let daily: [Forecast] = [
        Forecast(date: .init(timeIntervalSinceNow: 0), weather: .sunny, probability: 30, temperature: 19, high: 24, low: 18, location: "Cairo, Egypt", icon: "Sun"),
        Forecast(date: .init(timeIntervalSinceNow: day * 1), weather: .sunny, probability: 0, temperature: 19, high: 24, low: 18, location: "Cairo, Egypt", icon: "Sun"),
        Forecast(date: .init(timeIntervalSinceNow: day * 2), weather: .sunny, probability: 100, temperature: 19, high: 24, low: 18, location: "Cairo, Egypt", icon: "Sun"),
        Forecast(date: .init(timeIntervalSinceNow: day * 3), weather: .sunny, probability: 50, temperature: 18, high: 24, low: 18, location: "Cairo, Egypt", icon: "Sun"),
        Forecast(date: .init(timeIntervalSinceNow: day * 4), weather: .sunny, probability: 0, temperature: 19, high: 24, low: 18, location: "Cairo, Egypt", icon: "Sun"),
        Forecast(date: .init(timeIntervalSinceNow: day * 5), weather: .sunny, probability: 0, temperature: 19, high: 24, low: 18, location: "Cairo, Egypt", icon: "Sun")
    ]
    
    static let cities: [Forecast] = [
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 19, high: 28, low: 22, location: "Cairo, Egypt", icon: "Sun"),
        Forecast(date: .now, weather: .clear, probability: 0, temperature: 20, high: 32, low: 19, location: "Dubai, UAE",icon: "Moon"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 13, high: 16, low: 8, location: "Toronto, Canada", icon: "Sun"),
        Forecast(date: .now, weather: .clear, probability: 0, temperature: 23, high: 28, low: 19, location: "Texas, United States", icon: "Moon")
    ]
}

