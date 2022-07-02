//
//  NabBarContentView.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 20.05.2022.
//

import SwiftUI

struct NavBar: View {
    @AppStorage ("firstSwitchedOn") var firstSwitchedOn = false
    @AppStorage ("secondSwitchedOn") var secondSwitchedOn = false
    @State var showTop1 = false
    @State var showTop2 = false
    @State var showTop3 = false
    var body: some View {
        HStack(alignment: .top, spacing: 40) {
            Spacer()
            Button {
                self.showTop3.toggle()
                secondSwitchedOn = false
                firstSwitchedOn = false
                showTop1 = false
                showTop2 = false
            } label: {
                VStack {
                Text ("Home")
                    .font(.custom("Avenir Next", size: 18))
                    .foregroundColor(showTop3 ? Color(Constants.Colors.sand1!) : Color(Constants.Colors.primaryTeal!))
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 30, height: 4)
                    .offset(y: -10)
                    .foregroundColor(showTop3 ? Color(Constants.Colors.sand1!) : Color(Constants.Colors.primaryTeal!))
                    .opacity(showTop3 ? 1 : 0)
            }}
            .transition(.move(edge: .trailing))
            Button {
                self.showTop1.toggle()
                self.firstSwitchedOn.toggle()
                secondSwitchedOn = false
                showTop2 = false
                showTop3 = false
            } label: {
                VStack {
                Text ("Profile")
                    .font(.custom("Avenir Next", size: 18))
                    .foregroundColor(showTop1 ? Color(Constants.Colors.sand1!) : Color(Constants.Colors.primaryTeal!))
                RoundedRectangle(cornerRadius: 20)
                   .frame(width: 30, height: 4)
                    .offset(y: -10)
                    .foregroundColor(showTop1 ? Color(Constants.Colors.sand1!) : Color(Constants.Colors.primaryTeal!))
                    .opacity(showTop1 ? 1 : 0)
            }}
            Button {
                self.showTop2.toggle()
                self.secondSwitchedOn.toggle()
                firstSwitchedOn = false
                showTop1 = false
                showTop3 = false
            } label: {
                VStack {
                Text ("Balance")
                    .font(.custom("Avenir Next", size: 18))
                    .foregroundColor(showTop2 ? Color(Constants.Colors.sand1!) : Color(Constants.Colors.primaryTeal!))
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 30, height: 4)
                    .offset(y: -10)
                    .foregroundColor(showTop2 ? Color(Constants.Colors.sand1!) : Color(Constants.Colors.primaryTeal!))
                    .opacity(showTop2 ? 1 : 0)
            }}
Spacer()
        }
    }
}
