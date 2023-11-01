//
//  ContentView.swift
//  Speaker
//
//  Created by Franco Fantillo on 2023-10-28.
//

import SwiftUI

struct ContentView: View {
    
    @State var animate : Bool = true
    
    var body: some View {
        ZStack {
            ZStack {
                
                RoundedRectangle(cornerRadius: 25)
                
                HStack {
                    ZStack {
                        ZStack {
                            Circle()
                                .fill(.white)
                            Circle()
                                .stroke(.black, lineWidth: 8)
                                .frame(width: 82)
                            Circle()
                                .frame(width: 30)
                        }
                        .scaleEffect(CGSize(width: animate ? 1.0:1.1, height: animate ? 1.0:1.1))
                        .animation(.linear(duration: 0.125).repeatForever(autoreverses: true).delay(0.125), value: animate)
                        
                        Circle()
                            .stroke(Color("Color").opacity(0.3), lineWidth: 5)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white, radius: 10, x: -5, y: -5)
                            .scaleEffect(CGSize(width: animate ? 1.0 : 10.0, height: animate ? 1.0 : 10.0))
                            .animation(.linear(duration: 1).repeatForever(autoreverses: false).delay(0.125), value: animate)
                        Circle()
                            .stroke(Color("Color").opacity(0.3), lineWidth: 5)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white, radius: 10, x: -5, y: -5)
                            .scaleEffect(CGSize(width: animate ? 0.1 : 10.0, height: animate ? 0.1 : 10.0))
                            .animation(.linear(duration: 1).repeatForever(autoreverses: false).delay(0.375), value: animate)
                        Circle()
                            .stroke(Color("Color").opacity(0.3), lineWidth: 5)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white, radius: 10, x: -5, y: -5)
                            .scaleEffect(CGSize(width: animate ? 0.1 : 10.0, height: animate ? 0.1 : 10.0))
                            .animation(.linear(duration: 1).repeatForever(autoreverses: false).delay(0.625), value: animate)
                        Circle()
                            .stroke(Color("Color").opacity(0.3), lineWidth: 5)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white, radius: 10, x: -5, y: -5)
                            .scaleEffect(CGSize(width: animate ? 0.1 : 10.0, height: animate ? 0.1 : 10.0))
                            .animation(.linear(duration: 1).repeatForever(autoreverses: false).delay(0.875), value: animate)
                    }
                    .frame(width: 100)
                    .padding(.leading, 30)
                    
                    Spacer()
                    
                    ZStack {
                        ZStack {
                            Circle()
                                .fill(.white)
                            Circle()
                                .stroke(.black, lineWidth: 8)
                                .frame(width: 82)
                            Circle()
                                .frame(width: 30)
                        }
                        .scaleEffect(CGSize(width: animate ? 1.0:1.1, height: animate ? 1.0:1.1))
                        .animation(.linear(duration: 0.125).repeatForever(autoreverses: true), value: animate)
                        
                        Circle()
                            .stroke(Color("Color").opacity(0.3), lineWidth: 5)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white, radius: 10, x: -5, y: -5)
                            .scaleEffect(CGSize(width: animate ? 0.1 : 10.0, height: animate ? 0.1 : 10.0))
                            .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: animate)
                        Circle()
                            .stroke(Color("Color").opacity(0.3), lineWidth: 5)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white, radius: 10, x: -5, y: -5)
                            .scaleEffect(CGSize(width: animate ? 0.1 : 10.0, height: animate ? 0.1 : 10.0))
                            .animation(.linear(duration: 1).repeatForever(autoreverses: false).delay(0.25), value: animate)
                        Circle()
                            .stroke(Color("Color").opacity(0.3), lineWidth: 5)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white, radius: 10, x: -5, y: -5)
                            .scaleEffect(CGSize(width: animate ? 0.1 : 10.0, height: animate ? 0.1 : 10.0))
                            .animation(.linear(duration: 1).repeatForever(autoreverses: false).delay(0.5), value: animate)
                        Circle()
                            .stroke(Color("Color").opacity(0.3), lineWidth: 5)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white, radius: 10, x: -5, y: -5)
                            .scaleEffect(CGSize(width: animate ? 0.1 : 10.0, height: animate ? 0.1 : 10.0))
                            .animation(.linear(duration: 1).repeatForever(autoreverses: false).delay(0.75), value: animate)
                    }
                    .frame(width: 100)
                    .padding(.trailing, 30)
                }
                
                Image("bluetoothimg")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 90)
                    .foregroundColor(animate ? .white : .blue)
                    .animation(.linear(duration: 0.25).repeatForever(autoreverses: false), value: animate)
                
            }
            .frame(width: 350, height: 150)
            .padding()
        }
        .frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity)
        .background(Color("Color"))
        .onAppear {
            animate = false
        }
    }
}

#Preview {
    ContentView()
}
