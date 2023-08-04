//
//  AirPollution.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 8/4/23.
//

import Foundation

struct AQIResponse: Codable {
    let coord: Coord
    let list: [AQIEntry]
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
}

struct AQIEntry: Codable {
    let dt: Int
    let main: AQIMain
    let components: AQIComponents
}

struct AQIMain: Codable {
    let aqi: Int
}

struct AQIComponents: Codable {
    let co: Double?
    let no: Double?
    let no2: Double?
    let o3: Double?
    let so2: Double?
    let pm2_5: Double?
    let pm10: Double?
    let nh3: Double?
}
