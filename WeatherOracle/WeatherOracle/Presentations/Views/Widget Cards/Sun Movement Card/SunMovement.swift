//
//  SunMovementAnimation.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/18/23.
//

import SwiftUI

struct SunMovement: View {
    @State var time: Int
    @State var progressValue = CGFloat(0)
    var offset: Int
    var strokeColor : LinearGradient
    var sunColor : Color
    

    
    var body: some View {
        let circlePosition = CGPoint(x: 0, y: 133)
        let minsFromTime = TimeConverter().timeToMinutes(epoch: time, offset: offset)
        
        ZStack {
            SunPath()
                .stroke(strokeColor, lineWidth: 2)
            
            SunPath()
                .trim(from: progressValue, to: progressValue+0.01)
                .stroke(sunColor, style: StrokeStyle(lineWidth: 10, lineCap: .round, dash: [0, 10]))
                .onAppear(){
                    withAnimation(Animation.easeOut(duration: 2)){
                        self.progressValue = (circlePosition.x + CGFloat((minsFromTime/9)))/160
                    }
                }
        }
        .frame(width: 160, height: 45)
    }

}




struct SunMovementPreviews: PreviewProvider {
    static var previews: some View {
        SunMovement(time: 1684929490 , offset: 0, strokeColor: Color.linearBackgroundNight, sunColor: .yellow)
    }
}
