//
//  FirestoreManager.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//

// FirestoreManager.swift (Data Manager)

import Foundation

class JsonManager {
static let shared = JsonManager() // Singleton instance

    private var cities: [City] = []

    private init() {
        loadCityData()
    }

    private func loadCityData() {
        if let url = Bundle.main.url(forResource: "cities", withExtension: "json"),
            let data = try? Data(contentsOf: url) {

            let decoder = JSONDecoder()

            do {
                cities = try decoder.decode([City].self, from: data)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }

    func fetchCities(with searchText: String, completion: @escaping ([City]) -> Void) {
        let filteredCities = cities.filter { city in
            if searchText.isEmpty{
                return true
            }else{
                return city.city.lowercased().contains(searchText.lowercased())
            }
        }
          completion(filteredCities)
      }
}
