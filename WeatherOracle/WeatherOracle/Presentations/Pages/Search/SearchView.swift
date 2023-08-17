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
            DataPersistence(cities: $cities).loadPersistedData()
            refreshDataFromAPI()
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
                        DataPersistence(cities: $cities).removeCity(city)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(10)
        }
    }
    
    private func refreshDataFromAPI() {
        DispatchQueue.global().async {
            for cityIndex in cities.indices {
                var city = cities[cityIndex]
                
                viewModel.fetchWeatherData(lat: city.lat, lon: city.lon)
                
                DispatchQueue.main.async {
                    if let weatherData = viewModel.weatherData {
                        city.weather = weatherData.current?.weather?.first?.description ?? "Clear"
                        city.probability = Int(weatherData.current?.rain?.value ?? 0)
                        city.temperature = Int(round(weatherData.current?.temp ?? 0))
                        city.high = Int(round(weatherData.daily?.first?.temp?.max ?? 0))
                        city.low = Int(round(weatherData.daily?.first?.temp?.min ?? 0))
                        city.icon = mapToIcon(id: weatherData.current?.weather?.first?.id ?? 0,
                                              time: TimeConverter.getTimeOfDay(currentTime:  weatherData.current?.dt ?? 1,
                                                                               sunset: weatherData.current?.sunset ?? 1,
                                                                               sunrise: weatherData.current?.sunrise ?? 1,
                                                                               offset: weatherData.timezoneOffset ?? 1))
                        
                        cities[cityIndex] = city
                        DataPersistence(cities: $cities).savePopulatedCities()
                    }
                }
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
