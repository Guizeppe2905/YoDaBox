//
//  VideoAnimation.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 11.06.2022.
//

import SwiftUI

struct VideoAnimation: View {
    @State var titles = [
        "\(UserDefaults.standard.string(forKey: "companyName") ?? "Your Company Name")",
        "Our company produces",
        "",
        "You can buy it at \(UserDefaults.standard.string(forKey: "buy") ?? "our website")"
    ]
    @State var subtitles = [
        "",
        "\(UserDefaults.standard.string(forKey: "brand") ?? "best quality production")",
        "\(UserDefaults.standard.string(forKey: "slogan") ?? "")",
        "\(UserDefaults.standard.string(forKey: "website") ?? "") visit us!"
    ]
    @State var currentIndex: Int = 2
    @State var titleText: [AnimationModel] = []
    @State var subTitleAnimation: Bool = false
    @State var endAnimation = false
    var body: some View {
        ZStack {
        VStack(spacing: 20) {
            Spacer()
            HStack(spacing: 0) {
                ForEach(titleText) { text in
                    Text(text.text)
                        .offset(x: text.offset)
                }
                .font(.custom("Avenir Next", size: 20).bold())
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                
            }
            .offset(x: endAnimation ? -100 : 0)
            .opacity(endAnimation ? 0 : 1)
           .frame(maxWidth: .infinity, maxHeight: 100, alignment: .top)
            Text(subtitles[currentIndex])
                .offset(x: !subTitleAnimation ? 35 : 0)
                .font(.custom("Avenir Next", size: 20).bold())
                .foregroundColor(.white)
                .offset(x: endAnimation ? -25 : 0)
                .opacity(endAnimation ? 0 : 1)
                .multilineTextAlignment(.center)
        }
        .padding()
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: 150, alignment: .top)
        }
        .onAppear(perform: {
            currentIndex = 0
        })
        .onChange(of: currentIndex) { newValue in
            getSplitedText(text: titles[currentIndex]) {
                withAnimation(.easeInOut(duration: 3)) {
                    endAnimation.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                    titleText.removeAll()
                    subTitleAnimation.toggle()
                    endAnimation.toggle()
                    if currentIndex < (titles.count - 1) {
                        currentIndex += 1
                    } else {
                        currentIndex = 0
                    }
                }
            }
        }
    }
    func getSplitedText(text: String, completion: @escaping ()->()) {
        for (index, character) in text.enumerated() {
            titleText.append(AnimationModel(text: String(character)))
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.03) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    titleText[index].offset = 0
                }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(text.count) * 0.02) {
            withAnimation(.easeInOut(duration: 0.5)) {
                subTitleAnimation.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.95) {
                completion()
            }
        }
    }
    
}


