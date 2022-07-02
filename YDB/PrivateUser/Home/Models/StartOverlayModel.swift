//
//  StartOverlayModel.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 23.06.2022.
//

import SwiftUI

struct StartOverlayModel: View {
    var body: some View {
        ZStack {
            Text("BACK TO START")
                .font(.custom("Avenir Next", size: 12))
                .fontWeight(.bold)
                .padding(6)
                .foregroundColor(Color(Constants.Colors.primaryTeal!))
        }.background(Color(Constants.Colors.sand2!))
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}
