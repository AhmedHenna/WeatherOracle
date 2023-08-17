//
//  CityFirestoreDataSource.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//



import Firebase

class CityRepository: CityDataSource {
    static let shared = CityRepository()
    
    func fetchCities(with searchText: String, completion: @escaping ([City]) -> Void) {
        DataInjection.shared.provideJsonManager().fetchCities(with: searchText) { cities in
            completion(cities)
        }
    }
}
