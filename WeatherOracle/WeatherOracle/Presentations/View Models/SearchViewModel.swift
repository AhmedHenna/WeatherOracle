//
//  SearchViewModel.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//

import SwiftUI
import FirebaseFirestore

class SearchViewModel: ObservableObject {
    @Published var cities: [City] = []
    @Published var weatherData : Weather? = nil
    private let getCities = GetCities()
    private let getWeatherData = GetWeatherData()
    
    init() {
        fetchCities()
        
        LocationManager.shared.requestLocationPermission()
        LocationManager.shared.startUpdatingLocation()
        
        if let currentLocation = LocationManager.shared.currentLocation {
            fetchWeatherData(lat: currentLocation.coordinate.latitude, lon: currentLocation.coordinate.longitude)
        }
    }
    
    private func fetchCities(){
        getCities.execute { [weak self] cities in
            DispatchQueue.main.async {
                self?.cities = cities
            }
        }
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
