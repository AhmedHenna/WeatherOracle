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
    @Published var widgetCardData : [WidgetForecast] = []
    private let getWeatherData = GetWeatherData()
   
    // MARK: - Waiting for response from user
    private lazy var locationManager: LocationManager = {
        LocationManager { [weak self] latitude, longitude in
            self?.fetchWeatherData(lat: latitude, lon: longitude)
        }
    }()
    
    init() {
        locationManager.requestLocationUpdates()
        
    }
    
    // MARK: - Getting Data from API
    private func fetchWeatherData(lat: Double, lon: Double) {
        getWeatherData.execute(lat: lat, lon: lon) { [weak self] result in
            switch result {
            case .success(let weatherResponse):
                DispatchQueue.main.async {
                    self?.weatherData = weatherResponse
                    self?.mapHourlyData()
                    self?.mapDailyData()
                    self?.mapWidgetCardData()
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
                                             weatherID: item.weather?.first?.id ?? 800))
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
                                            weatherID: item.weather?.first?.id ?? 800))
        }
    }
    
    private func mapWidgetCardData(){
        guard let widgetData = weatherData else{
            print("Widget data not available")
            return
        }
        
        guard let widgetDataHourly = weatherData?.hourly else{
            print("Widget hourly not available")
            return
        }
        
        let currentTime = widgetData.current?.dt ?? 0
        let sunsetTime = widgetData.current?.sunset ?? 0
        let sunriseTime = widgetData.current?.sunrise ?? 0
        let isSunrise = (TimeConverter.getTimeOfDay(currentTime: currentTime, sunset: sunsetTime, sunrise: sunriseTime) == "Morning" ||
                         TimeConverter.getTimeOfDay(currentTime: currentTime, sunset: sunsetTime, sunrise: sunriseTime) == "Afternoon")
        let visibilityValue = widgetData.current?.visibility ?? 0
        let uviVales = getUVIValues(hourly: widgetDataHourly)
        
        widgetCardData.append(WidgetForecast(feelsLike: widgetData.current?.feelsLike ?? 0,
                                             currentRainfall: widgetData.current?.rain ?? Precipitation(value: 0.0),
                                             expectedRainfall: widgetData.daily?.first?.rain ?? 0,
                                             dewPoint: widgetData.current?.dewPoint ?? 0,
                                             windSpeed: widgetData.current?.windSpeed ?? 0,
                                             uviValue: widgetData.current?.uvi ?? 0,
                                             aqi: 0,
                                             actualTemp: widgetData.current?.temp ?? 0,
                                             uviStart: TimeConverter.convertEpochToTime(epoch: TimeInterval(uviVales.0 ?? 0), withSeconds: false),
                                             uviEnd: TimeConverter.convertEpochToTime(epoch: TimeInterval(uviVales.1 ?? 24), withSeconds: false),
                                             humidity: widgetData.current?.humidity ?? 0,
                                             windDirection: widgetData.current?.windDeg ?? 0,
                                             pressure: widgetData.current?.pressure ?? 0,
                                             visibility: visibilityValue,
                                             sunRise: widgetData.current?.sunrise ?? 0,
                                             sunSet: sunsetTime,
                                             currentTime: currentTime,
                                             isSunrise: isSunrise,
                                             visibilityDescription: getVisibilityDescription(visibility: visibilityValue))
        )
    }
    
    //MARK: - Helper Methods
    private func getUVIValues(hourly: [HourlyForecast]) -> (Int?, Int?){
        var start: Int? = nil
        var end: Int? = nil
            
        for item in hourly.prefix(24){
            if item.uvi ?? 10 > 2{
                if start == nil{
                    start = item.dt
                }
                end = item.dt
            }
        }
        
        return (start, end)
    }
}
