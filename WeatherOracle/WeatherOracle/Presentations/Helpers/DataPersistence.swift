//
//  DataPersistence.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 8/17/23.
//

import Foundation
import SwiftUI

struct DataPersistence {
    @Binding var cities: [Forecast]
    
    func removeCity(_ city: Forecast) {
        if let index = cities.firstIndex(where: { $0.id == city.id }) {
            cities.remove(at: index)
            savePopulatedCities()
        }
    }
    
    func savePopulatedCities() {
        do {
            let encodedData = try JSONEncoder().encode(cities)
            UserDefaults.standard.set(encodedData, forKey: "PopulatedCities")
        } catch {
            print("Error encoding populated cities: \(error)")
        }
    }
    
    func loadPersistedData() {
        if let data = UserDefaults.standard.data(forKey: "PopulatedCities") {
            do {
                let decodedCities = try JSONDecoder().decode([Forecast].self, from: data)
                cities = decodedCities
            } catch {
                print("Error decoding populated cities: \(error)")
            }
        }
    }
}

