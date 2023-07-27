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
    
    private lazy var locationManager: LocationManager = {
        LocationManager { [weak self] latitude, longitude in
            print(latitude, longitude)
            self?.fetchWeatherData(lat: latitude, lon: longitude)
        }
    }()
    
    init() {
        fetchCities()
        locationManager.requestLocationUpdates()
    }
    
    
    private func fetchCities(){
        getCities.execute { [weak self] cities in
            DispatchQueue.main.async {
                self?.cities = cities
            }
        }
    }
    
    private func fetchWeatherData(lat: Double, lon: Double) {
         getWeatherData.execute(lat: lat, lon: lon) { [weak self] result in
             switch result {
             case .success(let weatherResponse):
                 DispatchQueue.main.async {
                     self?.weatherData = weatherResponse
                     print("Latitude: \(String(describing: self?.weatherData?.current?.temp))")
                 }
             case .failure(let error):
                 print("Error fetching weather data: \(error.localizedDescription)")
             }
         }
     }
}
