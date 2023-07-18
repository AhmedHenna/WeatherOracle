//
//  SunMovementAnimation.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/18/23.
//

import SwiftUI

struct SunMovement: View {
    @State private var hour = 12
    @State private var min = 0
    var strokeColor : LinearGradient
    var sunColor : Color
    
    var body: some View {
        let circlePosition = CGPoint(x: 0, y: 133)

        let minsFromTime = TimeConverter().timeToMinutes(hours: hour, minutes: min)
        let progressValue = (circlePosition.x + CGFloat((minsFromTime/9)))/160
        
        ZStack {
            SunPath()
                .stroke(strokeColor, lineWidth: 2)
            
            SunPath()
                .trim(from: progressValue, to: progressValue+0.01)
                .stroke(sunColor, style: StrokeStyle(lineWidth: 10, lineCap: .round, dash: [0, 10]))
        }
        .frame(width: 160, height: 45)
    }

}




struct SunMovementPreviews: PreviewProvider {
    static var previews: some View {
        SunMovement(strokeColor: Color.linearBackgroundNight, sunColor: .yellow)
    }
}
