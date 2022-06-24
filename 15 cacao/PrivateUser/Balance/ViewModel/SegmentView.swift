//
//  SegmentView.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 31.05.2022.
//

import SwiftUI

struct SegmentView: View {
    @ObservedObject var userSetting = UserSettings()
    @State private var selection = 0
    @State var converterToRub: Double = 62
    private let items: [String] = ["USD", "RUB"]
    var body: some View {
        VStack{
        VStack {
            Picker(selection: $selection, label: Text("")) {
                ForEach(0..<items.count, id: \.self) { index in
                    Text(self.items[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
        }  .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(
                LinearGradient(colors: [
                        Color(Constants.Colors.primaryTeal!),
                        Color(Constants.Colors.sand2!),
                        Color(Constants.Colors.primaryTeal!),
                       ], startPoint: .topLeading, endPoint: .bottomTrailing)
                ))
            if selection == 0 {
                let doubleStr = String(format: "%.2f", ceil(userSetting.amountEarned * 100) / 100)
                Text("Number of ads watched - \(userSetting.numberOfVideos). Earned amount - \(doubleStr) USD")
                        .font(.custom("Avenir Next", size: 12))
                        .opacity(0.7)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom)
            } else {
                let rub = String(format: "%.2f", ceil(userSetting.amountEarned * converterToRub * 100) / 100)
                Text("Number of ads watched - \(userSetting.numberOfVideos). Earned amount - \(rub) RUB")
                        .font(.custom("Avenir Next", size: 12))
                        .opacity(0.7)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom)
            }
        }
        .padding(.top, -20)
    }
}
