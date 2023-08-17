//
//  Compass.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/20/23.
//

import SwiftUI

struct Compass: View {
    @State var speed: CGFloat
    @State var animation = CGFloat(90)
    @State var direction: CGFloat
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color("Text Secondary"),style: StrokeStyle(lineWidth: 10, lineCap: .butt, dash: [2,2]))
                .rotationEffect(.degrees(270))
            
            Image(systemName: "arrow.left")
                .scaleEffect(x:1, y:1)
                .frame(width: 10, height: 10)
                .glow()
                .offset(x: -23)
            
                .rotationEffect(.degrees(animation))
                .onAppear(){
                    withAnimation(Animation.easeOut(duration: 2)){
                        self.animation = direction
                    }
                }
            
            
            VStack (spacing: 60){
                Text("N")
                Text("S")
            }
            
            HStack(spacing: 65){
                Text("W")
                Text("E")
            }
        }
        .foregroundColor(.white)
        .font(.caption2)
        .frame(width: 100, height: 100)
        .overlay {
            ZStack(alignment: .center){
                directionMarkers
                VStack(spacing: -5){
                    Text("\(formatNumber(_:speed))")
                    Text("km/h")
                        .font(.caption2)
                }
                .foregroundColor(.white)
            }
        }
    }
    
    
    var directionMarkers : some View{
        ZStack{
            //North
            Circle()
                .trim(from: 0, to: 0.01)
                .stroke(.white ,style: StrokeStyle(lineWidth: 10, lineCap: .butt, dash: [2,2]))
                .rotationEffect(.degrees(269))
            
            //East
            Circle()
                .trim(from: 0.25, to: 0.26)
                .stroke(.white ,style: StrokeStyle(lineWidth: 10, lineCap: .butt, dash: [2,2]))
                .rotationEffect(.degrees(267))
            
            //South
            Circle()
                .trim(from: 0.5, to: 0.51)
                .stroke(.white ,style: StrokeStyle(lineWidth: 10, lineCap: .butt, dash: [2,2]))
                .rotationEffect(.degrees(269))
            
            
            
            //West
            Circle()
                .trim(from: 0.75, to: 0.76)
                .stroke(.white ,style: StrokeStyle(lineWidth: 10, lineCap: .butt, dash: [2,2]))
                .rotationEffect(.degrees(266))
        }
    }
}

struct Compass_Previews: PreviewProvider {
    static var previews: some View {
        Compass(speed: 9.7, direction: 0)
            .preferredColorScheme(.dark)
    }
}
