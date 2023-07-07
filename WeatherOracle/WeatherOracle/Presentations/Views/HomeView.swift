//
//  HomeView.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/7/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            Group {
                Text("Cairo")
                    .font(.largeTitle)
                    .fontWeight(.regular)
                Text("27°")
                    .font(.system(size: 96))
                    .fontWeight(.thin)
                    .offset(x: 15)
                Text("Mostly Clear")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Text Seconary"))
                HStack{
                    Text("H:24°")
                    Text("L:18°")
                }
                .font(.title3)
                .fontWeight(.semibold)
            }
            .foregroundColor(Color("Text Primary"))
            
            Image("Home Morning")
                .frame(maxWidth: .infinity)
        }
        .frame(maxHeight: .infinity)
        .background(Color.linearBackgroundMorning)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
