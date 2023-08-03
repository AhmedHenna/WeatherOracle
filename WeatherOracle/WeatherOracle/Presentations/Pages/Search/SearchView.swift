//
//  SearchView.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/10/23.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                weatherCards
            }
            .padding(.vertical, 8)
            .background(mapTimeToColor(time: viewModel.weatherData?.current?.dt ?? 1,
                                       sunset: viewModel.weatherData?.current?.sunset ?? 1,
                                       sunrise: viewModel.weatherData?.current?.sunrise ?? 1,
                                       offset: viewModel.weatherData?.timezoneOffset ?? 1))
            .searchable(text: $text, placement:
                    .navigationBarDrawer(displayMode: .always), prompt: Text("Cairo, New York, Dubai")){
                        ForEach(viewModel.cities){ suggestion in
                            if text == "" {
                                Button {
                                    text = suggestion.cityName
                                } label:{
                                    Text(suggestion.cityName)
                                        .searchCompletion(suggestion.cityName)
                                }
                            }
                        }
                    }
        }
    }
    
    
    var weatherCards: some View{
        ScrollView{
            VStack(alignment: .leading, spacing: 20) {
                ForEach(Forecast.cities) { city in
                    WeatherCard(forecast: city)
                }
            }.frame(maxWidth: .infinity)
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.dark)
    }
}
