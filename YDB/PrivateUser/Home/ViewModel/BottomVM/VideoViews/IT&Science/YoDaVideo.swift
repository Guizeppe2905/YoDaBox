//
//  VideoYoDa.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 22.05.2022.
//

import SwiftUI
import AVKit

struct ButtonYoDa: View {
    @ObservedObject var userSetting = UserSettings()
    @State private var action: Int? = 0
    @State var moveToVideo = false
    var body: some View {
        ZStack {
            Button(action: {
                self.moveToVideo.toggle()
                userSetting.numberOfVideos += 1
                userSetting.amountEarned += 0.15
            }) {
                Image(uiImage: Constants.Image.yodaTeal!)
                    .resizable()
                    .frame(width: 70, height: 70, alignment: .center)
                    .overlay(RoundedRectangle(cornerRadius: 25)
                        .stroke(Color(Constants.Colors.primaryTeal!), lineWidth: 3))
            } .sheet(isPresented: $moveToVideo) {
                VideoYoDa() }
        }
    }
}
struct VideoYoDa: View {
    @ObservedObject var viewModel = ViewModel()
    var body:  some  View {
        ZStack {
            VStack {
                HStack {
       Text("Watch this ad to earn 15 cents")
                        .multilineTextAlignment(.leading)
        Button(action: {
            self.viewModel.goBack()
            }) {
        Image(systemName: "xmark.circle")
            }
                }
                    .padding()
                    .background(Color(Constants.Colors.primaryTeal!))
                    .foregroundColor(.white)
                    .font(.custom("Avenir Next", size: 20))
            YoDaVideoView()
            }
        }
        .padding()
        .frame(width: 460, height: 790, alignment: .center)
        .background(Color(Constants.Colors.primaryTeal!))
    }
}
struct YoDaVideoView: View {
    var path = Bundle.main.path(forResource: "", ofType: "")
    var body:  some  View {
            ZStack {
        VideoPlayer (
            player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "yoda", ofType: "mp4")!))
        )
   }
}
}
