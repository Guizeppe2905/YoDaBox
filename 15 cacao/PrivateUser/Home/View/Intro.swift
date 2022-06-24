//
//  Intro.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 15.06.2022.
//

import SwiftUI

struct Intro: View {
    var body: some View {
        ZStack {
            VStack{
           Animation()
                Spacer()
                    Text("Quick way to test User Mode")
                        .foregroundColor(Color(Constants.Colors.primaryTeal!))
                        .font(.custom("Avenir Next", size: 25))
                    Button(action: closeIntro) {
                        HStack(alignment: .center) {
                            Spacer()
                            Image(uiImage: Constants.Image.ppl!)
                                .resizable()
                                .frame(width: 150, height: 150, alignment: .center)
                                .overlay(ImageOverlayCloseIntro(), alignment: .bottom)
                            Spacer()
                        }
                    }
                HStack {
                    Text("1. Set of ads is changed depending on the info you indicate in profile folders. \n 2. If you have already created an ad at Business Mode, then you can watch it by indicating the same industry in the Occupation Folder. \n 3. Number of ads watched & amount earned are calculated at Balance view. \n 4. To test Sing In Page, pls fill in Account form.")
                        .foregroundColor(Color(Constants.Colors.primaryTeal!))
                        .font(.custom("Avenir Next", size: 18))
                } .padding(.leading, 10)
                    .padding(.trailing, 10)
            Bottom()
            }
        }
    }
    func closeIntro() {
        let keyWindow = UIApplication.shared.connectedScenes
           .filter({$0.activationState == .foregroundActive})
           .map({$0 as? UIWindowScene})
           .compactMap({$0})
           .first?.windows
           .filter({$0.isKeyWindow}).first
       keyWindow!.rootViewController = UIHostingController(rootView: UserMainContentView())
       keyWindow!.makeKeyAndVisible()
    }
}
struct ImageOverlayCloseIntro: View {
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
