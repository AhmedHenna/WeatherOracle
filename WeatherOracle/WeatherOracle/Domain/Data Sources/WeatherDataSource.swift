//
//  WeatherDataSource.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//

import SwiftUI

protocol WeatherDataSource {
    func fetchWeatherData(lat: Double, lon: Double, completion: @escaping (Result<Weather, Error>) -> Void)
    
    func fetchAirPollutionData(lat: Double, lon: Double, completion: @escaping (Result<AQIResponse, Error>) -> Void)
}
