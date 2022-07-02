//
//  ImageOverlayModel.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 01.07.2022.
//

import SwiftUI

struct BackOverlayModel: View {
    var body: some View {
        ZStack {
            Text("< BACK")
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


//struct CustomOverlayCloseIntro: View {
 //   @State var overlayTitles = [
  //      OverlayTitle(id: 0, title: "BACK TO START"),
   //     OverlayTitle(id: 1, title: "INTRO"),
  //      OverlayTitle(id: 2, title: "BUSINESS MODE"),
 //       OverlayTitle(id: 3, title: "< BACK")
  //  ]
  //  var body: some View {
  //      ZStack {
  //          Text("")
  //              .font(.custom("Avenir Next", size: 18))
  //              .fontWeight(.bold)
   //             .padding(6)
   //             .foregroundColor(Color(Constants.Colors.primaryTeal!))
   //     }.background(Color(Constants.Colors.sand2!))
   //     .opacity(0.8)
    //    .cornerRadius(10.0)
  //      .padding(6)
  //  }
//}

//struct OverlayTitle: Identifiable {
//    var id: Int
//    var title: String
//}
