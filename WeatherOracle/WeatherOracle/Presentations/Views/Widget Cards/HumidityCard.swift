//
//  HumidityCard.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/19/23.
//

import SwiftUI

struct HumidityCard: View {
    @State var humidity : Int
    @State var dewPoint : Int
    
    
    var body: some View {
        WidgetCardContainer(icon: "humidity", title: "HUMIDITY", width: 160, height: 160) {
            content
        }
    }
    
    var content: some View{
        VStack (alignment: .leading, spacing: 10){
            Text("\(humidity)%")
                .font(.title)
            
            Spacer()
            
            Text("The dew point is \(dewPoint)° right now")
            .font(.caption)
            .offset(y: -5)
        }
        .foregroundColor(.white)
    }
}

struct HumidityCard_Previews: PreviewProvider {
    static var previews: some View {
        HumidityCard(humidity: 83, dewPoint: 19)
    }
}
