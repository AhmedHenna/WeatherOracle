//
//  SearchViewModel.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//

import SwiftUI
import FirebaseFirestore

class SearchViewModel: ObservableObject {
    @Published var cities: [City] = []
    private let getCities = GetCities()
    
    init() {
        getCities.execute { [weak self] cities in
            DispatchQueue.main.async {
                self?.cities = cities
            }
        }
    }
}
