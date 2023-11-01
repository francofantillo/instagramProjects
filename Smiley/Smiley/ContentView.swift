//
//  ContentView.swift
//  Smiley
//
//  Created by Franco Fantillo on 2023-06-12.
//

import SwiftUI

struct ContentView: View {
    
    let smileColor = Color(red: 97 / 255, green: 44 / 255, blue: 14 / 255)
    let height: CGFloat = 200
    let eyeXOffset: CGFloat = 30
    let eyeYOffset: CGFloat = -25
    let smileHeight: CGFloat = 55
    let smileWidth: CGFloat = 80
    let smileOffset: CGFloat = 55
    let emojiBorder: CGFloat = 0.5
    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    
    @State var counter: Float = 0
    @State var eyesClosed: Bool = false
    
    let radial = RadialGradient(gradient: Gradient(colors: [.yellow, .red]), center: .center, startRadius: 60, endRadius: 140)
    
    let linear = LinearGradient(gradient: Gradient(colors: [.white, .clear]), startPoint: .top, endPoint: .center)
    
    var body: some View {
        ZStack {

            Circle()
                .fill(radial)
                .frame(width: height, height: height)
                .overlay(
                    Circle()
                        .stroke(.red , lineWidth: emojiBorder)
                )
                .shadow(color: .black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: .white, radius: 10, x: -5, y: -5)
            
            Circle()
                .fill(linear)
                .frame(width: height, height: height)
            
            Eye(frame: CGSize(width: 17.5, height: 30))
                .offset(x: -eyeXOffset, y: eyeYOffset)
                
            
            Eye(frame: eyesClosed ? CGSize(width: 17.5, height: 1) : CGSize(width: 17.5, height: 30))
                .offset(x: eyeXOffset, y: eyeYOffset)
                .animation(.linear(duration: 0.3), value: eyesClosed)
                
            Smile()
                .fill(smileColor)
                .frame(width: smileWidth, height: smileHeight)
                .offset(y: smileOffset)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color("Color"))
        .onReceive(timer, perform: { _ in
            
            print(counter)
            
            if counter == 3 {
                eyesClosed.toggle()
            }
            if counter == 4 {
                eyesClosed.toggle()
                counter = 0
            }
            
            counter += 1
        })
    }
}

struct Eye: View {
    
    let lightBrown = Color(red: 86 / 255, green: 36 / 255, blue: 9 / 255)
    let darkBrown = Color(red: 159 / 255, green: 90 / 255, blue: 26 / 255)
    
    var frame: CGSize
    
    var body: some View {
        ZStack {
            Ellipse()
                .fill(lightBrown)
                .frame(width: frame.width, height: frame.height)
            Ellipse()
                .fill(darkBrown)
                .frame(width: frame.width * 0.885, height: frame.height * 0.833)
                .offset(y: 1.5)
        }
    }
}


struct Smile: Shape {
        
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: 0), control: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: 4))
        path.addQuadCurve(to: CGPoint(x: 0, y: 4), control: CGPoint(x: rect.midX, y: rect.midY + 8))
        path.closeSubpath()
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
