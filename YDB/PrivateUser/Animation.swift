//
//  AnimationContentView.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 19.05.2022.
//

import SwiftUI

struct Animation: View {
    @State var titles = [
        "YoDa Box",
        "Your Data Box",
        "Manage YoDa & Earn"
    ]
    @State var subtitles = [
        "Secure Your Data",
        "Earn by watching ads",
        "Make Your Data work for you"
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
                        .offset(y: text.offset)
                }
                .font(.custom("Avenir Next", size: 30).bold())
                
                .foregroundColor(.white)
            }
            .offset(y: endAnimation ? -100 : 0)
            .opacity(endAnimation ? 0 : 1)
           .frame(maxWidth: .infinity, maxHeight: 40, alignment: .top)
            Text(subtitles[currentIndex])
                .opacity(0.7)
                .offset(y: !subTitleAnimation ? 35 : 0)
                .font(.custom("Avenir Next", size: 20))
                .foregroundColor(.white)
                .offset(y: endAnimation ? -25 : 0)
                .opacity(endAnimation ? 0 : 1)
        }
        .padding()
        .background(Color(Constants.Colors.primaryTeal!))
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: 100, alignment: .top)
        }
        .onAppear(perform: {
            currentIndex = 0
        })
        .onChange(of: currentIndex) { newValue in
            getSplitedText(text: titles[currentIndex]) {
                withAnimation(.easeInOut(duration: 1)) {
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
