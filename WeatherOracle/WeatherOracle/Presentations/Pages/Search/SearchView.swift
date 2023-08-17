//
//  SearchView.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/10/23.
//

import SwiftUI

struct SearchView: View {
    @State var showSearch = false
    @StateObject private var viewModel = SearchViewModel()
    @State var cities: [Forecast] = []
    
    var body: some View {
        NavigationView {
            VStack {
                searchIcon
                weatherCards
            }
            .background(mapTimeToColor(time: viewModel.weatherData?.current?.dt ?? 1,
                                       sunset: viewModel.weatherData?.current?.sunset ?? 1,
                                       sunrise: viewModel.weatherData?.current?.sunrise ?? 1,
                                       offset: viewModel.weatherData?.timezoneOffset ?? 1))
        }
        .onAppear {
            loadPersistedData()
        }
    }
    
    var searchIcon: some View {
        HStack {
            Button {
                showSearch = true
            } label: {
                HStack {
                    Image(systemName: "magnifyingglass")
                    Text("Search for a new city")
                }
                .font(.body.weight(.bold))
                .frame(maxWidth: .infinity, maxHeight: 40)
                .foregroundColor(.secondary)
                .strokeStyle(cornerRadius: 14)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                .padding(20)
            }
            .sheet(isPresented: $showSearch) {
                ResultsView(populatedCities: $cities)
            }
        }
    }
    
    var weatherCards: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(cities) { city in
                    WeatherCard(forecast: city) {
                        removeCity(city)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(10)
        }
    }
    
    private func removeCity(_ city: Forecast) {
        if let index = cities.firstIndex(where: { $0.id == city.id }) {
            cities.remove(at: index)
            savePopulatedCities()
        }
    }
    
    private func savePopulatedCities() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(cities), forKey: "PopulatedCities")
    }
    
    private func loadPersistedData() {
        if let data = UserDefaults.standard.value(forKey: "PopulatedCities") as? Data {
            if let decodedCities = try? PropertyListDecoder().decode([Forecast].self, from: data) {
                cities = decodedCities
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.dark)
    }
}
