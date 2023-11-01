//
//  ContentView.swift
//  BatteryFill
//
//  Created by Franco Fantillo on 2023-10-26.
//

import SwiftUI

struct BatteryAnimation: View {
    
    var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    @State private var percent : Float = 20.0
    @State private var waveOffset = Angle(degrees: 0)
    @State private var waveOffset2 = Angle(degrees: 0)
    @State private var shake : Bool = false
    @State private var shakerange: Float = 0
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 0) {
                Rectangle()
                    .fill(.white)
                    .frame(width: 35, height: 15)
                    .cornerRadius(5)
                    .offset(CGSize(width: 0, height: 2.5))
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .fill(.black.shadow(.drop(color: Color("BrightGreen"),radius: Double(percent/2))))
                        .stroke(.white, lineWidth: 5)
                        .frame(width: 200, height: 400)
                    
                    Wave(offSet: Angle(degrees: waveOffset.degrees), percent: Double(percent))
                        .fill(Color("BrightGreen"))
                        .ignoresSafeArea(.all)
                        .mask(
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .frame(width: 200, height: 400)
                        )
                        .frame(width: 200, height:400)
                    
                    Wave(offSet: Angle(degrees: waveOffset2.degrees), percent: Double(percent))
                        .fill(Color("BrightGreen").opacity(0.5))
                        .ignoresSafeArea(.all)
                        .mask (
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .frame(width: 200, height: 400)

                        )
                        .frame(width: 200, height: 400)
                    
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(.white, lineWidth: 5)
                        .frame(width: 200, height: 400)
                }
                .edgesIgnoringSafeArea(.all)
            }
            .frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity)

            try! ParticleView(node: "Spark", percent: $percent)
                .frame(width: UIScreen.main.bounds.width, height: 400)
                .offset(CGSize(width: 0.0, height: -180.0))
            
            InvisibleSlider(percent: $percent)
                            .frame(width: 200, height: 400)

        }
        .offset(x: shake ? -2 : 2)
        .animation(.linear(duration: 0.01), value: shake)

        .onAppear {
            withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
            }
            withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
                self.waveOffset2 = Angle(degrees: 360)
            }
        }
        .onReceive(timer, perform: { _ in
            
            if percent >= 80 {
                shake.toggle()
            }
        })
    }
}

struct Wave: Shape {
    
    var offSet: Angle
    var percent: Double
    
    var animatableData: Double {
        get { offSet.degrees }
        set { offSet = Angle(degrees: newValue) }
    }
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let lowestWave = 0.02
        let highestWave = 1.00
        
        let newPercent = lowestWave + (highestWave - lowestWave) * (percent / 100)
        let waveHeight = 0.015 * rect.height
        let yOffSet = CGFloat(1 - newPercent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offSet
        let endAngle = offSet + Angle(degrees: 360 + 10)
        
        p.move(to: CGPoint(x: 0, y: yOffSet + waveHeight * CGFloat(sin(offSet.radians))))
        
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            p.addLine(to: CGPoint(x: x, y: yOffSet + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }
        
        p.addLine(to: CGPoint(x: rect.width, y: rect.height))
        p.addLine(to: CGPoint(x: 0, y: rect.height))
        p.closeSubpath()
        
        return p
    }
}

struct InvisibleSlider: View {
    
    @Binding var percent: Float
    
    var body: some View {
        GeometryReader { geo in
            let dragGesture = DragGesture(minimumDistance: 0)
                .onChanged { value in
                    let percent = 1.0 - Double(value.location.y / geo.size.height)
                    self.percent = Float(max(0, min(100, percent * 100)))
                }
            
            Rectangle()
                .opacity(0.001)
                .frame(width: geo.size.width, height: geo.size.height)
                .gesture(dragGesture)
        }
    }
}

struct WaveAnimation_Previews: PreviewProvider {
    static var previews: some View {
        BatteryAnimation()
            .background(Color.black)
    }
}
