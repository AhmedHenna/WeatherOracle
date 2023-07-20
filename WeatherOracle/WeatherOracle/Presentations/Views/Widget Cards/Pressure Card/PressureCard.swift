//
//  PressureCard.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/20/23.
//

import SwiftUI

struct PressureCard: View {
    @State var pressure : Double
    
    
    var body: some View {
        WidgetCardContainer(icon: "gauge.medium", title: "PRESSURE", width: 160, height: 160) {
            content
        }
    }
    
    var content: some View{
        VStack(alignment: .center, spacing: -10){
            let hectopascalsToInchesOfMercury = pressure / 33.8639
            let mappedValue = ((hectopascalsToInchesOfMercury) - 28) * (270) / (31 - 28)
            
            PressureSemiCircle(pressureValue: hectopascalsToInchesOfMercury, rotation: mappedValue)
                .overlay (alignment: .center){
                    VStack{
                        Text("\(formatNumber(_: hectopascalsToInchesOfMercury > 31 ? 31 : hectopascalsToInchesOfMercury))")
                        Text("inHg")
                            .font(.footnote)
                    }
                    .font(.title2)
                }
            
            
            
            HStack(spacing: 50){
                Text("Low")
                Text("High")
            }
            .font(.caption2)
        }
        .foregroundColor(.white)
        .offset(x: 15, y: 2)
    }
}

struct PressureCard_Previews: PreviewProvider {
    static var previews: some View {
        PressureCard(pressure: 1000)
    }
}
