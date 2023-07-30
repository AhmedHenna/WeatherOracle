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
    @Published var hourlyData : [WeatherForcast] = []
    @Published var dailyData : [WeatherForcast] = []
    private let getWeatherData = GetWeatherData()
    
    private lazy var locationManager: LocationManager = {
        LocationManager { [weak self] latitude, longitude in
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
                    self?.mapHourlyData()
                    self?.mapDailyData()
                }
            case .failure(let error):
                print("Error fetching weather data: \(error.localizedDescription)")
            }
        }
    }
    
    private func mapHourlyData(){
        guard let hourlyArray = weatherData?.hourly else {
            print("Hourly data not available")
            return
        }
        
        for item in hourlyArray.prefix(24) {
            let epochTimestamp: TimeInterval = TimeInterval(item.dt ?? 0)
            let date = TimeConverter.convertEpochToDate(epoch: epochTimestamp)
            hourlyData.append(WeatherForcast(date: date,
                                             temperature: Int(round(item.temp ?? 0)),
                                             rainPercentage: item.pop ?? 0,
                                             icon: item.weather?.first?.description ?? ""))
        }
    }
    
    private func mapDailyData(){
        guard let dailyArray = weatherData?.daily else {
            print("Daily data not available")
            return
        }
        
        for item in dailyArray.prefix(7) {
            let epochTimestamp: TimeInterval = TimeInterval(item.dt ?? 0)
            let date = TimeConverter.convertEpochToDate(epoch: epochTimestamp)
            dailyData.append(WeatherForcast(date: date,
                                            temperature: Int(round(item.temp?.morn ?? 0)),
                                            rainPercentage: item.pop ?? 0,
                                            icon: item.weather?.description ?? ""))
        }
    }
}
