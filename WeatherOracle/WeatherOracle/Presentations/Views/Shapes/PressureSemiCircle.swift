//
//  PressureSemiCircl.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/20/23.
//

import SwiftUI

struct PressureSemiCircle: View {
    @State var pressureValue : Double
    @State var rotation: Double
    
    var body: some View {
        
        ZStack{
                Circle()
                .trim(from: 0.0, to: 0.75)
                    .stroke(Color("Text Secondary"),
                            style: StrokeStyle(lineWidth: 10, lineCap: .butt, dash: [2, 2]))
                    .rotationEffect(.degrees(135))
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: 15, height: 4)
                    .glow()
                    .offset(x: -50)
                    .rotationEffect(.degrees(pressureValue > 31 ? 225 : rotation - 45))
            }
        .frame(width: 100, height: 100)
        
    }
}

struct PressureSemiCircle_Previews: PreviewProvider {
    static var previews: some View {
        PressureSemiCircle(pressureValue: 1013, rotation: 0)
            .preferredColorScheme(.dark)
    }
}
