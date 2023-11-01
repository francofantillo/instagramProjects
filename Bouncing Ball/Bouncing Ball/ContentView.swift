//
//  ContentView.swift
//  Bouncing Ball
//
//  Created by Franco Fantillo on 2023-10-27.
//

import SwiftUI

struct ContentView: View {
    
    @State var toggle: Bool = false
    @State var scale: Double = 0.04
    @State var opacity: Double = 1
    @State var scale2: Double = 0.04
    @State var opacity2: Double = 1
    
    let offset: CGFloat = 150
    
    var body: some View {
        VStack {
            
            Toggle("", isOn: $toggle)
                .opacity(0)
                .onChange(of: toggle) { newValue, oldValue in

                    if oldValue {
                        withAnimation(.linear(duration: 1.0)) {
                            scale = 2
                            opacity = 0
                        }
                        
                        scale2 = 0.04
                        opacity2 = 1
                        
                    } else {
                        
                        withAnimation(.linear(duration: 1.0)) {
                            scale2 = 2
                            opacity2 = 0
                        }
                        
                        scale = 0.04
                        opacity = 1
                    }
                }
            
            ZStack {
                
                RotateRepresentableView(toggleBinding: $toggle)
                
                Circle()
                    .stroke(Color("Color"), lineWidth: 20)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white, radius: 10, x: -5, y: -5)
                    .rotation3DEffect(.degrees(80), axis: (x: 1, y: 0, z: 0))
                    .scaleEffect(CGSize(width: scale, height: scale))
                    .opacity(opacity)
                    .offset(y:offset)
                
                Circle()
                    .stroke(Color("Color"), lineWidth: 20)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white, radius: 10, x: -5, y: -5)
                    .rotation3DEffect(.degrees(80), axis: (x: 1, y: 0, z: 0))
                    .scaleEffect(CGSize(width: scale2, height: scale2))
                    .opacity(opacity2)
                    .offset(y:offset)
            }
        }
        .background(Color("Color"))
    }
}

#Preview {
    ContentView()
}
