//
//  FirestoreManagerProtocol.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//

import Foundation

protocol CityDataSource {
    func fetchCities(completion: @escaping ([City]) -> Void)
}
