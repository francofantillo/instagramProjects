//
//  Water.swift
//  MorningNight
//
//  Created by Franco Fantillo on 2023-09-29.
//

import SwiftUI

struct Water: View {
    var body: some View {
        ZStack {
            Rectangle()
            VStack {
                Rectangle()
                    .fill(.white)
                Rectangle()
                    .fill(.white)
                Rectangle()
                    .fill(.white)
                Rectangle()
                    .fill(.white)
            }
        }
        
    }
}

#Preview {
    Water()
}
