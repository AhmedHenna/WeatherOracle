//
//  CityFirestoreDataSource.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//



import Firebase

class CityFirestoreDataSource: CityDataSource {
    static let shared = CityFirestoreDataSource()

    func fetchCities(completion: @escaping ([City]) -> Void) {
        DataInjection.shared.provideFirestoreManager().fetchCities { cities in
            completion(cities)
        }
    }
}
