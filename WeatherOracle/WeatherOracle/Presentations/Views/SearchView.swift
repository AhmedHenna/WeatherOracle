//
//  SearchView.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/10/23.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        WeatherCard(forecast: Forecast(date: .now, weather: .clear, probability: 0, temperature: 19, high: 28, low: 22, location: "Cairo, Egypt", icon: "Sun"))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.dark)
    }
}
