//
//  AppContainer.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//

import Foundation

class DataInjection {
    static let shared = DataInjection()

    private init() {}

    func provideCityDataSource() -> CityDataSource {
        return CityRepository.shared
    }

    func provideFirestoreManager() -> FirestoreManager {
        return FirestoreManager.shared
    }
}

