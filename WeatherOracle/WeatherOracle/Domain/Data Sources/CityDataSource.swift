//
//  FirestoreManagerProtocol.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//

import Foundation

protocol CityDataSource {
    func fetchCities(with searchText: String, completion: @escaping ([City]) -> Void)
}
