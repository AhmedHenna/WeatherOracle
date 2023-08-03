//
//  Rainfall.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/19/23.
//

import SwiftUI

struct RainfallCard: View {
    @State var currentRainfall : Precipitation
    @State var expectedRainfall24H : Double
    
    
    var body: some View {
        WidgetCardContainer(icon: "drop.fill", title: "RAINFALL", width: 160, height: 160) {
            content
        }
    }
    
    var content: some View{
        VStack (alignment: .leading, spacing: 10){
            Text("\(formatNumber(_: currentRainfall.value ?? 0)) mm")
                .font(.title)
            
            Spacer()
            
            Text("\(formatNumber(_: expectedRainfall24H)) mm expected in the next 24h.")
            .font(.caption)
            .offset(y: -5)
        }
        .foregroundColor(.white)
    }
}

struct RainfallCard_Previews: PreviewProvider {
    static var previews: some View {
        RainfallCard(currentRainfall: Precipitation(value: 0), expectedRainfall24H: 0.05 )
    }
}
