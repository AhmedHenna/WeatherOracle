//
//  WeatherModel.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/10/23.
//

import Foundation

enum WeatherStuff: String {
    case clear = "Clear"
    case cloudy = "Cloudy"
    case sunny = "Sunny"
    case tornado = "Tornado"
    case windy = "Fast Wind"
}


struct Weather: Codable {
    let lat: Double?
    let lon: Double?
    let timezone: String?
    let timezoneOffset: Int?
    let current: CurrentWeather?
    let hourly: [HourlyForecast]?
    let daily: [DailyForecast]?
}

struct CurrentWeather: Codable {
    let dt: Int?
    let sunrise: Int?
    let sunset: Int?
    let temp: Double?
    let feelsLike: Double?
    let pressure: Int?
    let humidity: Int?
    let dewPoint: Double?
    let uvi: Double?
    let clouds: Int?
    let visibility: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let windGust: Double?
    let weather: [WeatherDescription]?
    let rain: Precipitation?
    let snow: Precipitation?
}

struct HourlyForecast: Codable {
    let dt: Int?
    let temp: Double?
    let feels_like: Double?
    let pressure: Int?
    let humidity: Int?
    let dewPoint: Double?
    let uvi: Double?
    let clouds: Int?
    let visibility: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let windGust: Double?
    let pop: Double?
    let weather: [WeatherDescription]?
    let rain: Precipitation?
    let snow: Precipitation?
}

struct DailyForecast: Codable {
    let dt: Int?
    let sunrise: Int?
    let sunset: Int?
    let moonrise: Int?
    let moonset: Int?
    let moonPhase: Double?
    let summary: String?
    let temp: DailyTemperature?
    let feelsLike: DailyTemperature?
    let pressure: Int?
    let humidity: Int?
    let dewPoint: Double?
    let windSpeed: Double?
    let windDeg: Int?
    let windGust: Double?
    let clouds: Int?
    let uvi: Double?
    let pop: Double?
    let rain: Double?
    let snow: Double?
    let weather: [WeatherDescription]?
}

struct DailyTemperature: Codable {
    let morn: Double?
    let day: Double?
    let eve: Double?
    let night: Double?
    let min: Double?
    let max: Double?
}

struct WeatherDescription: Codable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}

struct Precipitation: Codable {
    let value: Double?
}
