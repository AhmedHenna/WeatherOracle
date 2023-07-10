//
//  Tabs.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/10/23.
//

import SwiftUI

struct Tabs: View {
    @Binding var selection: Int
    
    var body: some View {
        VStack(spacing: 5) {
            buttons
            seperator
        }
        .padding(.top, 25)
    }
    
    var buttons : some View{
        HStack {
            Button {
                withAnimation(.easeInOut(duration: 0.5)) {
                    selection = 0
                }
            } label: {
                Text("Hourly Forecast")
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            Button {
                withAnimation(.easeInOut(duration: 0.5)) {
                    selection = 1
                }
            } label: {
                Text("Weekly Forecast")
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .font(.subheadline.weight(.semibold))
        .foregroundColor(.secondary)
    }
    
    var seperator : some View{
        Divider()
            .background(.white.opacity(0.5))
            .blendMode(.overlay)
            .shadow(color: .black.opacity(0.2), radius: 0, x: 0, y: 1)
            .blendMode(.overlay)
            .overlay {
                //Underline
                HStack {
                    Divider()
                        .frame(width: UIScreen.main.bounds.width / 2, height: 3)
                        .background(Color("Linear Highlight"))
                        .blendMode(.overlay)
                }
                .frame(maxWidth: .infinity, alignment: selection == 0 ? .leading : .trailing)
                .offset(y: -1)
            }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs(selection: .constant(0))
            .preferredColorScheme(.dark)
    }
}
