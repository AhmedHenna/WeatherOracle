//
//  UVIndexCard.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/19/23.
//

import SwiftUI


struct UVIndexCard: View {
    @State var uviValue : Int
    @State var startTime: String
    @State var endTime: String
    
    
    var body: some View {
        WidgetCardContainer(icon: "sun.max.fill", title: "UV INNDEX", width: 160, height: 160) {
            content
        }
    }
    
    var content: some View{
        VStack (alignment: .leading, spacing: 5){
            
            VStack (alignment: .leading){
                Text("\(uviValue)")
                    .font(.title)
                Text(uviText(uviValue: uviValue))
            }
            
            IndexMeter(indexValue: uviValue, numberOfValues: 11, barColor: Color.linearUVIndexMeter)
    
            Spacer()
            
            Text("Use sun protection from \(startTime)-\(endTime).")
            .font(.caption)
            .lineLimit(nil)
            .offset(y:-5)
            .fixedSize(horizontal: false, vertical: true)
        }
        .foregroundColor(.white)
    }
}

struct UVIndexCard_Previews: PreviewProvider {
    static var previews: some View {
        UVIndexCard(uviValue:  11  , startTime: "9:03", endTime: "6:00")
    }
}
