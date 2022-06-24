//
//  BottomContentView.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 20.05.2022.
//

import SwiftUI

struct Bottom: View {
    @ObservedObject var userSetting = UserSettings()
    @State var moveToVideo = false
    var body: some View {
        VStack {
            HStack {
            Text("Scroll to see all ads")
                .padding()
                .font(.custom("Avenir Next", size: 18).bold())
                .foregroundColor(Color(Constants.Colors.primaryTeal!))
                .multilineTextAlignment(.leading)
          Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                let formattedJobs = userSetting.userOccupation.map{String(describing:$0)}.joined(separator: ", ")
                if formattedJobs.contains("IT") {
                    ITViewModel()
                } else if formattedJobs.contains("Medicine") {
                    MedicineViewModel()
                } else if formattedJobs.contains("Science") {
                    ScienceViewModel()
                } else if formattedJobs.contains("Food") {
                    FoodViewModel()
                } else if formattedJobs.contains("Sport") {
                    SportViewModel()
                } else if formattedJobs.contains("Construction") {
                    ConstructionViewModel()
                } else if formattedJobs.contains("Travel") {
                    TravelViewModel()
                } else if formattedJobs.contains("Media") {
                    MediaViewModel()
                } else if formattedJobs.contains("Beauty") {
                    BeautyViewModel()
                } else if formattedJobs.contains("Cars") {
                    CarsViewModel()
                } else if formattedJobs.contains("Pets") {
                    PetsViewModel()
                } else if formattedJobs.contains("Diving") {
                    DivingViewModel()
                } else if formattedJobs.contains("Movies") {
                    MoviesViewModel()
                } else if formattedJobs.contains("Games") {
                    GamesViewModel()
                } else if formattedJobs.contains("Fashion") {
                    FashionViewModel()
                } else if formattedJobs.contains("Gardening") {
                    GardeningViewModel()
                } else if formattedJobs.contains("Repair") {
                    RepairViewModel()
                } else if formattedJobs.contains("Home Design") {
                    HomeDesignViewModel()
                } else if formattedJobs.contains("Flowers") {
                    FlowersViewModel()
                } else if formattedJobs.contains("Fishing") {
                    FishingViewModel()
               } else {
              DefaultViewModel()
            }
            }
        } .padding(.bottom)
    }
}
