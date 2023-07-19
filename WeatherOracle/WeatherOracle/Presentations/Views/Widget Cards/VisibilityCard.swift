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
        WidgetCardContainer(icon: "eye.fill", title: "Visibility") {
            content
        }
    }
    
    var content: some View{
        VStack (alignment: .leading, spacing: 10){
            Text("\(visibileMeters/1000) km")
                .font(.title)
            
            Spacer()
            
            Text(visibileMeters <= 5000 ? "It is perfectly clear right now."
                 : "Visibility is currently hampered by \(weatehrState) ")
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
