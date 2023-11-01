//
//  ContentView.swift
//  SliderDimmer
//
//  Created by Franco Fantillo on 2023-10-04.
//

import SwiftUI

protocol PresentColorPickerDelegate: AnyObject {
    func presentColorPicker()
}

struct Config {
    let minimumValue: CGFloat
    let maximumValue: CGFloat
    let totalValue: CGFloat
    let knobRadius: CGFloat
    let radius: CGFloat
}

struct AdjustLights: View {
    
    let automationMode: Bool
    let hideBackButton: Bool
    let config = Config(minimumValue: 0.0,
                        maximumValue: 100.0,
                        totalValue: 100.0,
                        knobRadius: 15.0,
                        radius: 125.0)
    
    @State var sliderValue: CGFloat
    @State var angleValue: CGFloat
    
    init(startingSliderValue: CGFloat, automationMode: Bool, hideBackButton: Bool) {
        self.automationMode = automationMode
        self.hideBackButton = hideBackButton
        self._sliderValue = State(initialValue: startingSliderValue)
        let degrees = 360 * (startingSliderValue/100)
        self._angleValue = State(initialValue: degrees)
    }

    var body: some View {
            
        VStack {
            Spacer()
                .frame(minHeight: 0, maxHeight: .infinity)
            
            ZStack {
                
                Circle()
                    .trim(from: 0.0, to: config.totalValue)
                    .stroke(Color(.gray), lineWidth: 8)
                    .frame(width: config.radius * 2, height: config.radius * 2)
                    .rotationEffect(.degrees(-90))
                
                Circle()
                    .trim(from: 0.0, to: sliderValue/config.totalValue)
                    .stroke(Color.white, lineWidth: 8)
                    .frame(width: config.radius * 2, height: config.radius * 2)
                    .shadow(color: .white, radius: 8)
                    .rotationEffect(.degrees(-90))
                
                Circle()
                    .fill(.white)
                    .frame(width: config.knobRadius * 2, height: config.knobRadius * 2)
                    .padding(10)
                    .offset(y: -config.radius)
                    .rotationEffect(Angle.degrees(Double(angleValue)))
                    .gesture(DragGesture(minimumDistance: 0.0)
                                .onChanged({ (value) in

                                    change(location: value.location)
                                    })
                    )
                
                Image("IconPower")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .shadow(color: .white, radius: 2)
                    .opacity(0.1 < sliderValue/config.totalValue ? Double(sliderValue/config.totalValue) : 0.1)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: config.radius * 0.8, height: config.radius * 0.8)
                    .gesture(TapGesture().onEnded { _ in
                                            if sliderValue == 100 {
                                                sliderValue = 0
                                                angleValue = 0
                                            } else {
                                                sliderValue = 100
                                                angleValue = 360
                                            }
                                        })

            }
            
            Spacer()
                .frame(minHeight: 0, maxHeight: .infinity)

        }
        .frame(maxWidth: .infinity)
        .background(.black)
        .navigationTitle("")
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
        
    }
    
    private func change(location: CGPoint) {
        
        let vector = CGVector(dx: location.x, dy: location.y)
        
        let angle = atan2(vector.dy - (config.knobRadius + 10), vector.dx - (config.knobRadius + 10) ) + .pi/2
        
        let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
        
        let value = fixedAngle / (2.0 * .pi) * config.totalValue
        
        if value >= config.minimumValue && value <= config.maximumValue {
            
            sliderValue = value
            
            angleValue = fixedAngle * 180 / .pi
        }
    }
}

struct AdjustLights_Previews: PreviewProvider {
    static var previews: some View {
        AdjustLights(startingSliderValue: CGFloat(50), automationMode: true, hideBackButton: false)
    }
}
