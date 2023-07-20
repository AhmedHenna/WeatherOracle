//
//  WindCard.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/20/23.
//

import SwiftUI

struct WindCard: View {
    @State var speed: CGFloat
    @State var direction: CGFloat
    
    var body: some View {
        WidgetCardContainer(icon: "wind", title: "WIND", width: 160, height: 160) {
            content
        }
    }
    
    var content: some View{
        Compass(speed: speed, direction: direction)
            .offset(x: 15)
        
    }
}

struct WindCard_Previews: PreviewProvider {
    static var previews: some View {
        WindCard(speed: 9.7, direction: 240)
    }
}
