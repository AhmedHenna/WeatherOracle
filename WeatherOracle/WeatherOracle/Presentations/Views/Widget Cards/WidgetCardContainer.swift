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
    @State var width: CGFloat
    @State var height: CGFloat
    var content: () -> Content
    
    var body: some View {
        ZStack (alignment: .leading){
            shape
            VStack (alignment: .leading){
                iconAndTitle
                content()
            }
            .padding(15) // Use positive padding values
        }
        .frame(width: width, height: height)
    }
    
    var shape: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(Color.clear)
            .frame(width: width, height: height)
            .shadow(color: .black.opacity(0.25), radius: 10, x: 5, y: 4)
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
        WidgetCardContainer(icon: "sunrise", title: "SUNRISE", width: 160, height: 160) {
            Text("Content")
                .font(.headline)
                .foregroundColor(Color("Text Secondary"))
        }
    }
}
