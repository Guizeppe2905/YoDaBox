//
//  IntroOverlayModel.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 23.06.2022.
//

import SwiftUI

struct IntroOverlayModel: View {
    var body: some View {
        ZStack {
            Text("INTRO")
                .font(.custom("Avenir Next", size: 18))
                .fontWeight(.bold)
                .padding(6)
                .foregroundColor(Color(Constants.Colors.primaryTeal!))
        }.background(Color(Constants.Colors.sand2!))
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}
