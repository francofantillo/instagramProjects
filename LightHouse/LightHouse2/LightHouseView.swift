//
//  LightHouseView.swift
//  LightHouse2
//
//  Created by Franco Fantillo on 2023-09-20.
//

import SwiftUI

struct LightHouseView: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var zPosition = true
    @State var counter = 1
    
    var body: some View {
        ZStack {
            Image(.nightsea)
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .aspectRatio(contentMode: .fit)
            VStack {
                Spacer()
                Rectangle()
                    .frame(height: 100)
            }
            Image(.lighthoouse)
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 450)
                .aspectRatio(contentMode: .fit)
                .offset(y:150)
                .zIndex(zPosition ? 0 : 5)
                .onReceive(timer, perform: { _ in
                    if counter % 5 == 0 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            zPosition.toggle()
                        }
                    }
                    counter += 1
                })
            RotateRepresentableView()
                .frame(width: UIScreen.main.bounds.width * 2, alignment: .center)
                .offset(x: -126)
                .zIndex(1)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    LightHouseView()
}
