//
//  WeatherRepository.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/23/23.
//

import Foundation

class WeatherRepository: WeatherDataSource {
    private let apiClient = OpenWeatherAPI()

    func fetchWeatherData(lat: Double, lon: Double, completion: @escaping (Result<Weather, Error>) -> Void) {
        apiClient.fetchWeatherData(lat: lat, lon: lon, completion: completion)
    }
}
