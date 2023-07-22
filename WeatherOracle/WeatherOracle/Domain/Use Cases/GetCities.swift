//
//  GetCities.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//


struct GetCities {
    let cityDataSource: CityDataSource = DataInjection.shared.provideCityDataSource()

    func execute(completion: @escaping ([City]) -> Void) {
        cityDataSource.fetchCities { cities in
            completion(cities)
        }
    }
}
