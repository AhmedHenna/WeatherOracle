//
//  UVIndexCard.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/19/23.
//

import SwiftUI


struct UVIndexCard: View {
    @State var uviValue : Int
    @State var startTime: Int
    @State var endTime: Int
    
    
    var body: some View {
        WidgetCardContainer(icon: "sun.max.fill", title: "UV INNDEX") {
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
            
            UVIndexMeter(uviValue: uviValue)
    
            Spacer()
            
            Text("Use sun protection from \(startTime)am-\(endTime)pm.")
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
        UVIndexCard(uviValue: 2, startTime: 9, endTime: 6)
    }
}
