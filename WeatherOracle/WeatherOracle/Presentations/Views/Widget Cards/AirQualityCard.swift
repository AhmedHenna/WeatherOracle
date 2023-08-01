//
//  AirQualityCard.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/19/23.
//

import SwiftUI

struct AirQualityCard: View {
    @State var aqiValue : Int
    @State var startTime: Int
    @State var endTime: Int
    
    
    var body: some View {
        WidgetCardContainer(icon: "aqi.medium", title: "AIR QUALITY", width: 350, height: 160) {
            content
        }
    }
    
    var content: some View{
        VStack (alignment: .leading, spacing: 5){
    
            Spacer()
            
            HStack (spacing: 3){
                Text("\(aqiValue)")
                    .font(.title)
                Text("- \(airQualityTitle(aqiValue:aqiValue))")
            }
            
            IndexMeter(indexValue: aqiValue, numberOfValues: 500, barColor: Color.linearAirQualityMeter)
    
            Spacer()
            
            Text(airQualityDescription(aqiValue: aqiValue))
            .font(.caption)
            .lineLimit(nil)
            .offset(y:-5)
            .fixedSize(horizontal: false, vertical: true)
        }
        .foregroundColor(.white)
    }
}

struct AirQualityCard_Previews: PreviewProvider {
    static var previews: some View {
        AirQualityCard(aqiValue: 75, startTime: 9, endTime: 6)
    }
}
