//
//  FeelsLikeCard.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/19/23.
//

import SwiftUI

struct FeelsLikeCard: View {
    @State var feelsLikeTemp : Int
    @State var actualTemp : Int
    
    
    var body: some View {
        WidgetCardContainer(icon: "thermometer.medium", title: "FEELS LIKE", width: 160, height: 160) {
            content
        }
    }
    
    var content: some View{
        VStack (alignment: .leading, spacing: 10){
            Text("\(feelsLikeTemp)°")
                .font(.title)
            
            Spacer()
            
            Text(feelsLikeTemp > actualTemp ? "Humidity is making it feel hotter."
                 : (feelsLikeTemp < actualTemp ? "Wind is making it feel cooler."
                    : "Similar to the actual temperature."))
            .font(.caption)
            .offset(y: -5)
        }
        .foregroundColor(.white)
    }
}

struct FeelsLikeCard_Previews: PreviewProvider {
    static var previews: some View {
        FeelsLikeCard(feelsLikeTemp: 27, actualTemp: 27)
    }
}
