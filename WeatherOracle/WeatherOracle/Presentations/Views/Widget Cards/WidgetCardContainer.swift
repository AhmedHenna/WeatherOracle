//
//  WidgetCardContainer.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/17/23.
//

import SwiftUI

struct WidgetCardContainer<Content: View>: View {
    @State var icon: String
    @State var title: String
    var content: () -> Content
    
    var body: some View {
        ZStack (alignment: .leading){
            shape
            VStack (alignment: .leading){
                iconAndTitle
                content()
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 15)
        }
        .frame(width: 160, height: 160)
        
        
    }
    
    var shape: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: 160, height: 160)
            .shadow(color: .black.opacity(0.25), radius: 10, x: 5, y: 4)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
            .strokeStyle(cornerRadius: 30)
    }
    
    var iconAndTitle: some View {
        HStack(spacing: 2) {
            Image(systemName: icon)
            Text(title)
        }
        .foregroundColor(Color("Text Secondary"))
        .font(.caption)
    }
}


struct WidgetCardContainer_Previews: PreviewProvider {
    static var previews: some View {
        WidgetCardContainer(icon: "sunrise", title: "SUNRISE") {
            Text("Content")
                .font(.headline)
                .foregroundColor(Color("Text Secondary"))
        }
    }
}
