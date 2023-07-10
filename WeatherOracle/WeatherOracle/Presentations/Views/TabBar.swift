//
//  TabBar.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/10/23.
//

import SwiftUI

struct TabBar: View {
    var action: () -> Void
    
    var body: some View {
        ZStack {
            arcShape
            buttons
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
    
    var arcShape : some View{
        Arc()
            .fill(Color.linearBackgroundMorning)
            .frame(height: 88)
    }
    
    var buttons : some View{
        HStack {
            Button {
                action()
            } label: {
                Image(systemName: "mappin.and.ellipse")
                    .frame(width: 44, height: 44)
            }
            
            Spacer()
            
            NavigationLink {
                SearchView()
            } label: {
                Image(systemName: "list.bullet")
                    .frame(width: 44, height: 44)
            }
        }
        .font(.title2)
        .foregroundColor(.white)
        .padding(EdgeInsets(top: 20, leading: 32, bottom: 24, trailing: 32))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(action: {})
            .preferredColorScheme(.dark)
    }
}
