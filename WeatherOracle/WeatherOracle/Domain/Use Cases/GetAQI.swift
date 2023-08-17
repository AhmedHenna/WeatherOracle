//
//  GetAQI.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 8/4/23.
//

import Foundation

struct GetAQI {
    private let openWeatherAPI = OpenWeatherAPI()
    
    func execute(lat: Double, lon: Double, completion: @escaping (Result<AQIResponse, Error>) -> Void)  {
        openWeatherAPI.fetchAirPollutionData(lat: lat, lon: lon, completion: completion)
    }
}
