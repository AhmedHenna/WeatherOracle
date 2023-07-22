//
//  GetCities.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//


struct GetCities {
    private let cityDataSource: CityDataSource = DataInjection.shared.provideCityDataSource()

    func execute(completion: @escaping ([City]) -> Void) {
        cityDataSource.fetchCities { cities in
            completion(cities)
        }
    }
}
