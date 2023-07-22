//
//  GetWeatherData.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//

import Foundation

struct GetWeatherData {
    private let openWeatherAPI = OpenWeatherAPI()
    
    func execute(lat: Double, lon: Double, completion: @escaping (Result<Weather, Error>) -> Void) {
        openWeatherAPI.fetchWeatherData(lat: lat, lon: lon, completion: completion)
    }
}
