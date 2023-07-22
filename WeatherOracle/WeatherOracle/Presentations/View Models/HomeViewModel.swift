//
//  HomeViewModel.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//

import Foundation
import CoreLocation

class HomeViewModel : ObservableObject{
    @Published var weatherData : Weather? = nil
    private let getWeatherData = GetWeatherData()
    
    init() {
        LocationManager.shared.requestLocationPermission()
        LocationManager.shared.startUpdatingLocation()
        
        let currentLocation = LocationManager.shared.currentLocation
        print("Current Location: \(String(describing: currentLocation?.coordinate.latitude)), \(String(describing: currentLocation?.coordinate.longitude))")
        fetchWeatherData(lat: currentLocation?.coordinate.latitude ?? 4, lon: currentLocation?.coordinate.longitude ?? 5)
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
