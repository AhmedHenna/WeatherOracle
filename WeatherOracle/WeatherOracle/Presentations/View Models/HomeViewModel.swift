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
    
    private lazy var locationManager: LocationManager = {
           LocationManager { [weak self] latitude, longitude in
               print(latitude, longitude)
               self?.fetchWeatherData(lat: latitude, lon: longitude)
           }
       }()
    
    init() {
        locationManager.requestLocationUpdates()
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
