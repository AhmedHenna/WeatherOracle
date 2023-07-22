//
//  HomeViewModel.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//

import Foundation

class HomeViewModel : ObservableObject{
    @Published var weatherData : Weather? = nil
    private let getWeatherData = GetWeatherData()
    
    init() {
        fetchWeatherData(lat: <#T##Double#>, lon: <#T##Double#>)
    }
    
    private func fetchWeatherData(lat: Double, lon: Double) {
        getWeatherData.execute(lat: lat, lon: lon) { result in
            switch result {
            case .success(let weatherResponse):
                self.weatherData = weatherResponse
            case .failure(let error):
                print("Error fetching weather data: \(error.localizedDescription)")
            }
        }
    }
}
