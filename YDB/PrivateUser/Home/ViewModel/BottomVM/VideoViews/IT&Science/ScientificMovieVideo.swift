//
//  ScientificMovieVideo.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 12.06.2022.
//

import SwiftUI
import AVKit

struct ButtonScientificMovie: View {
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
                Image(uiImage: Constants.Image.scienceMovie!)
                    .resizable()
                    .frame(width: 70, height: 70, alignment: .center)
                    .overlay(RoundedRectangle(cornerRadius: 25)
                        .stroke(Color(Constants.Colors.primaryTeal!), lineWidth: 3))
            } .sheet(isPresented: $moveToVideo) {
                VideoScienceMovie() }
        }
    }
}
struct VideoScienceMovie: View {
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
            ScienceMovieVideoView()
            }
        }
        .padding()
        .frame(width: 460, height: 800, alignment: .center)
        .background(Color(Constants.Colors.primaryTeal!))
    }
}
struct ScienceMovieVideoView: View {
    var path = Bundle.main.path(forResource: "", ofType: "")
    var body:  some  View {
        ZStack {
            ZStack {
        VideoPlayer (
            player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "scientificMovie", ofType: "mp4")!))
         )
        }
            ZStack(alignment: .bottomLeading) {
                Spacer()
                VStack (spacing: 35) {
                    Spacer()
                    if UserDefaults.standard.string(forKey: "industry") == "Science" {
                  VideoAnimation()
                    } else {
                        Spacer()
                   Text("Your advertisement could be here. Please, visit Business Mode of this App to set your promotion.")
                            .multilineTextAlignment(.center)
                            .font(.custom("Avenir Next", size: 20))
                    Text("* Note: only the corresponding to the selected industry video is modified.")
                            .multilineTextAlignment(.trailing)
                            .font(.custom("Avenir Next", size: 16))
                    }
                }
                .padding()
            } .frame(width: 320, height: 570, alignment: .center)
            .foregroundColor(.white)
            .font(.title)
}
    }
}
