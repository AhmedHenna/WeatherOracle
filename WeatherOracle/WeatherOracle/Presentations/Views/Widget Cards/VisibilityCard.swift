//
//  VisibilityCard.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/19/23.
//

import SwiftUI

struct VisibilityCard: View {
    @State var visibileMeters : Int
    @State var weatehrState : String
    
    
    var body: some View {
        WidgetCardContainer(icon: "eye.fill", title: "VISIBILITY", width: 160, height: 160) {
            content
        }
    }
    
    var content: some View{
        VStack (alignment: .leading, spacing: 10){
            Text("\(visibileMeters/1000) km")
                .font(.title)
            
            Spacer()
            
            Text(weatehrState)
                .font(.caption)
                .offset(y: -5)
        }
        .foregroundColor(.white)
    }
}

struct VisibilityCard_Previews: PreviewProvider {
    static var previews: some View {
        VisibilityCard(visibileMeters: 5000, weatehrState: "Fog")
    }
}
