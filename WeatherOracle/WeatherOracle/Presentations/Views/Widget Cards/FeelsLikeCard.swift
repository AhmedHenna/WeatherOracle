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
            
            Text(feelsLikeHelper(feelsLike: feelsLikeTemp, actualTemp: actualTemp))
                .font(.caption)
                .offset(y: -5)
        }
        .foregroundColor(.white)
    }
}

func feelsLikeHelper(feelsLike: Int, actualTemp: Int) -> String{
    if feelsLike > actualTemp && abs(feelsLike - actualTemp) >= 3{
        return "Humidity is making it feel hotter."
    }else if feelsLike < actualTemp && abs(feelsLike - actualTemp) >= 3{
        return "Wind is making it feel cooler."
    }else{
        return "Similar to the actual temperature."
    }
}


struct FeelsLikeCard_Previews: PreviewProvider {
    static var previews: some View {
        FeelsLikeCard(feelsLikeTemp: 27, actualTemp: 27)
    }
}
