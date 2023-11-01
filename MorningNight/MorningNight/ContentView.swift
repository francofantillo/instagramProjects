//
//  ContentView.swift
//  MorningNight
//
//  Created by Franco Fantillo on 2023-09-23.
//

import SwiftUI

struct ContentView: View {
    
    let mountainGradientDay = LinearGradient(gradient: Gradient(colors: [Color("LightMountainColour1"), .black]), startPoint: .center, endPoint: .bottomLeading)
    
    let mountainGradientNight = LinearGradient(gradient: Gradient(colors: [Color("DarkMountainColour2"), .black]), startPoint: .center, endPoint: .bottomLeading)
    
    let hillGradientDay = LinearGradient(gradient: Gradient(colors: [Color("LightMountainColour1"), .black]), startPoint: .top, endPoint: .bottom)
    
    let hillGradientNight = LinearGradient(gradient: Gradient(colors: [Color("DarkMountainColour1"), .black]), startPoint: .top, endPoint: .bottom)
    
    let skyGradientDay = LinearGradient(gradient: Gradient(colors: [Color("LightSkyColour1"), Color("LightSkyColour2")]), startPoint: .top, endPoint: .bottom)
    
    let skyGradientNight = LinearGradient(gradient: Gradient(colors: [Color("DarkSkyColour1"), Color("LightSkyColour2")]), startPoint: .top, endPoint: .bottom)
    
    let waterGradientDay = LinearGradient(gradient: Gradient(colors: [Color("LightWaterColour2"), Color("LightWaterColour1")]), startPoint: .top, endPoint: .bottom)
    
    let waterGradientNight = LinearGradient(gradient: Gradient(colors: [Color("DarkWaterColour2"), Color("DarkWaterColour1")]), startPoint: .top, endPoint: .bottom)
    
    @State var toggle = true
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .fill(toggle ? skyGradientNight : skyGradientDay)
                    .frame(height: UIScreen.main.bounds.height)
                    .animation(.linear, value: toggle)
                Spacer()
            }
            
            VStack {
                Spacer()
                    .frame(height: 80)
                HStack{
                    Spacer()
                    Circle()
                        .frame(height: 100)
                        .foregroundColor(Color(.lightSkyColour2))
                        .shadow(color: .lightSkyColour2,radius: 20)
                    Spacer()
                        .frame(width: 50)
                }
                .offset(y: toggle ? 500 : 0)
                .animation(.bouncy, value: toggle)
                HStack {
                    Spacer()
                    Moon()
                        .frame(height: 100)
                        .foregroundColor(Color(.lightSkyColour2))
                        .shadow(color: .lightSkyColour2, radius: 20)
                        .rotationEffect(.degrees(-30))
                    Spacer()
                        .frame(width: 50)
                }
                .offset(y: toggle ? -110 : 500)
                .animation(.bouncy, value: toggle)
                Spacer()
            }
            VStack {
                Spacer()
                    .frame(height: UIScreen.main.bounds.height/2)
                Rectangle()
                    .fill(toggle ? waterGradientNight : waterGradientDay)
                    .animation(.linear, value: toggle)
            }
            
            Image("reflection", bundle: nil)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.4)
                .offset(y: 100)
            
            VStack {
                Mountain()
                    .fill(toggle ? mountainGradientNight : mountainGradientDay)
                    .animation(.linear, value: toggle)
                Spacer()
                    .frame(height: UIScreen.main.bounds.height/2)
            }
            
            VStack {
                Spacer()
                Hill()
                    .fill(toggle ? hillGradientNight : hillGradientDay)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.2)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x:0, y:1, z:0)
                    )
                    .animation(.linear, value: toggle)
            }
            
            VStack {
                Spacer()
                GeometryReader { geometry in
                    ZStack {
                        Hill()
                            .fill(toggle ? hillGradientNight : hillGradientDay)
                            .animation(.linear, value: toggle)
                        
                        Tree()
                            .fill(toggle ? hillGradientNight : hillGradientDay)
                            .frame(width: geometry.size.width/2, height: geometry.size.width/2)
                            .offset(x: 100, y: -50)
                            .animation(.linear, value: toggle)
                        
                        Tree()
                            .fill(toggle ? hillGradientNight : hillGradientDay)
                            .frame(width: geometry.size.width/3, height: geometry.size.width/3)
                            .offset(x:-100, y: -100)
                        Tree()
                            .fill(toggle ? hillGradientNight : hillGradientDay)
                            .frame(width: geometry.size.width/4, height: geometry.size.width/4)
                            .offset(x: -30, y: -60)
                            .animation(.linear, value: toggle)
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.5)
            }
                
            VStack {
                Spacer()
                    .frame(height: 500)
            }
            VStack {
               
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.8)
                HStack {
                    Spacer()
                    DarkmodeToggle(darkmode: $toggle)
                        .shadow(color: .white, radius: 20)
                    Spacer()
                }
                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
        .ignoresSafeArea(.all)
}
