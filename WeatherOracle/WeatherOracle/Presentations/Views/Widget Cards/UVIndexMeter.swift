//
//  UVIndexMeter.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/19/23.
//

import SwiftUI

struct UVIndexMeter: View {
    
    @State var indexValue : Int
    @State var numberOfValues: CGFloat
    @State var circleOffset = CGFloat(0)
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                
                
                RoundedRectangle(cornerRadius: 2.5)
                    .fill(Color.linearUVIndexMeter)
                    .frame(width: geometry.size.width, height: 5)
                    .overlay(alignment: .leading){
                        Circle()
                            .frame(width: 5, height: 5)
                            .foregroundColor(.white)
                            .offset(x: circleOffset)
                            .onAppear {
                                withAnimation(Animation.easeOut(duration: 2)) {
                                    circleOffset = circleOffset
                                    + ((geometry.size.width / numberOfValues) * CGFloat(indexValue))
                                    - (indexValue == 0 ? 0 : 5)
                                }
                            }
                    }
            }
        }
    }
}

struct UVIndexMeter_Previews: PreviewProvider {
    static var previews: some View {
        UVIndexMeter(indexValue: 10, numberOfValues: 11)
    }
}
