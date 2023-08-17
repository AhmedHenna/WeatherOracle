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
        
    }
    
    var searchIcon: some View{
        HStack{
            Button {
                showSearch = true
            } label: {
                HStack{
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
                ResultsView()
            }
        }
    }
    
    
    var weatherCards: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(Forecast.cities) { city in
                    WeatherCard(forecast: city)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(10)
        }
    }
}




struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.dark)
    }
}
