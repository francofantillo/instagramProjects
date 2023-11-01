//
//  HotColdToggle.swift
//  FireAndWater
//
//  Created by Franco Fantillo on 2023-09-15.
//

import SwiftUI

struct HotColdToggle: View {
    
    @Binding private var toggleOn: Bool
    
    let hotGradient = LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
    let coldGradient = LinearGradient(colors: [.blue, .white], startPoint: .center, endPoint: .bottomTrailing)
    
    init(toggleOn: Binding<Bool>) {
        self._toggleOn = toggleOn
    }
    
    var body: some View {
        ZStack {

           VStack (){
               ZStack {
                   
                   Circle()
                       .fill(toggleOn ? coldGradient : hotGradient)
                       .frame(width:40, height:40)
                       //.foregroundColor(toggleOn ? .blue : .orange)
                       .offset(x:toggleOn ? 18 : -18)
                       
                   Image(systemName: "cloud.rain")
                       .offset(x:toggleOn ? 18 : -18)
                       .opacity(toggleOn ? 1 : 0)
                       .foregroundColor(.white)
                   Image(systemName: "flame")
                       .offset(x:toggleOn ? 18 : -18)
                       .opacity(toggleOn ? 0 : 1)
                       .foregroundColor(.white)

               }
               .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
               .padding(24)
           }
       }
       .ignoresSafeArea(.all)
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HotColdToggle(toggleOn: .constant(false))
    }
}
