//
//  UVIndexMeter.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/19/23.
//

import SwiftUI

struct UVIndexMeter: View {
    @State var uvCircleLocation = CGFloat(-62)
    @State var uviValue : Int
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 2.5)
                    .fill(Color.linearUVIndexMeter)
                    .frame(width: geometry.size.width, height: 5)
                    .overlay {
                        Circle()
                            .frame(width: 5, height: 5)
                            .foregroundColor(.white)
                            .offset(x: uvCircleLocation)
                            .onAppear {
                                withAnimation(Animation.easeOut(duration: 2)) {
                                    self.uvCircleLocation = uvCircleLocation
                                    + ((geometry.size.width / 11) * CGFloat(uviValue))
                                    - (uviValue == 0 ? 0 : 5)
                                }
                            }
                    }
            }
        }
    }
}

struct UVIndexMeter_Previews: PreviewProvider {
    static var previews: some View {
        UVIndexMeter(uviValue: 4)
    }
}
