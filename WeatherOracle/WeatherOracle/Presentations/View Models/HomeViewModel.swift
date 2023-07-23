//
//  HomeViewModel.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//

import Foundation
import CoreLocation
import Combine


class HomeViewModel : ObservableObject{
    @Published var weatherData : Weather? = nil
    private let getWeatherData = GetWeatherData()

    
    let locationManager = LocationManager { latitude, longitude in
        print(latitude, longitude)
    }
    
    init() {
        locationManager.requestLocationUpdates()
    }
    
    private func fetchWeatherData(lat: Double, lon: Double) {
        getWeatherData.execute(lat: lat, lon: lon) { result in
            switch result {
            case .success(let weatherResponse):
                self.weatherData = weatherResponse
                print("Latitude: \(String(describing: self.weatherData?.daily.description)))")
            case .failure(let error):
                print("Error fetching weather data: \(error.localizedDescription)")
            }
        }
    }
}
