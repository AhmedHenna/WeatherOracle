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
