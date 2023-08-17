//
//  WeatherCard.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/10/23.
//

import SwiftUI

struct WeatherCard: View {
    var forecast: Forecast
    var onDelete: () -> Void
    
    var body: some View {
        ZStack(alignment: .bottom) {
            backgroundShape
            HStack(alignment: .bottom) {
                weatherContent
                Spacer()
                weatherDescription
            }
            .overlay(Image(forecast.icon)
                .resizable()
                .frame(width: 300, height: 300)
                .padding(.trailing, 4)
                .offset(x: 90, y: -40)
            )
            .foregroundColor(.white)
            .padding(.bottom, 20)
            .padding(.leading, 20)
        }
        .frame(width: 340, height: 180, alignment: .bottom)
        .contextMenu {
            Button("Delete") {
                onDelete()
            }
        }
    }
    
    var backgroundShape: some View {
        Trapezoid()
            .fill(Color.linearWidgetBackground)
            .overlay(
                Trapezoid()
                    .stroke(Color.white, lineWidth: 1)
            )
            .frame(width: 340, height: 175)
    }
    
    var weatherContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            // MARK: Forecast Temperature
            Text("\(forecast.temperature)°")
                .font(.system(size: 64))
            
            VStack(alignment: .leading, spacing: 2) {
                // MARK: Forecast Temperature Range
                Text("H:\(forecast.high)°  L:\(forecast.low)°")
                    .font(.footnote)
                    .foregroundColor(Color("Text Secondary"))
                
                // MARK: Forecast Location
                Text(forecast.location)
                    .font(.body)
                    .lineLimit(1)
            }
        }
    }
    
    var weatherDescription: some View {
        Text(forecast.weather.capitalized)
            .font(.footnote)
            .padding(.trailing, 24)
    }
}

struct WeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCard(forecast: Forecast(date: .now, weather: "Clear", probability: 0, temperature: 19, high: 28, low: 22, location: "Cairo, Egypt", icon: "Sun")) {
            // onDelete action
        }
        .preferredColorScheme(.dark)
    }
}
