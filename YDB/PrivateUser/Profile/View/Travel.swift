//
//  Travel.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 24.05.2022.
//

import SwiftUI

struct TravelView: View {
    @ObservedObject var viewModel = ViewModel()
    @ObservedObject var userSetting = UserSettings()
    @State var selectedTravel: [String] = []
    @State var selectedFolder = ""
    @State var travels = [
        ProfileDetailsModel(id: 0, image: "extreme", title: "Extreme", selected: false),
        ProfileDetailsModel(id: 1, image: "diving", title: "Diving", selected: false),
        ProfileDetailsModel(id: 2, image: "sporttours", title: "Sport-tours", selected: false),
        ProfileDetailsModel(id: 3, image: "excursion", title: "Excursions", selected: false),
        ProfileDetailsModel(id: 4, image: "mountain", title: "Mountains", selected: false),
        ProfileDetailsModel(id: 5, image: "beach", title: "Beach", selected: false)
]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
        VStack {
            Spacer()
            HStack {
                Spacer()
           Text("Travel")
                .font(.custom("Avenir Next", size: 32))
                .foregroundColor(Color(Constants.Colors.primaryTeal!))
                .padding(.top)
                .multilineTextAlignment(.leading)
                Button(action: { self.viewModel.goBack() }) {
                    HStack(alignment: .center) {
                        Spacer()
                        Image(systemName: "xmark.circle")
                         .padding()
                         .foregroundColor(Color(Constants.Colors.primaryTeal!))
                    }
                }
                Spacer()
            } .padding(.leading, 10)
            Text("What kind of travel tours do you prefer?")
                .font(.custom("Avenir Next", size: 20))
                .foregroundColor(Color(Constants.Colors.primaryTeal!))
                .padding(.top, -10)
                .multilineTextAlignment(.leading)
            Spacer(minLength: 0)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 35, content: {
                ForEach(travels.reversed()) { travel in
                    VStack(spacing: 15) {
                        Image(travel.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                        HStack {
                        Text(travel.title)
                            .font(.custom("Avenir Next", size: 16))
                            .fontWeight(.bold)
                        Button {
                            selectedFolder = "\(travel.id)"
                            if selectedFolder == "0" {
                                travels[0].selected.toggle()
                                if travels[0].selected == true {
                                    selectedTravel.append(travels[0].title)
                                } else {
                                let index = find(value: "Extreme", in: selectedTravel)
                                    selectedTravel.remove(at: index!)
                                }
                            } else if selectedFolder == "1" {
                                travels[1].selected.toggle()
                                if travels[1].selected == true {
                                    selectedTravel.append(travels[1].title)
                                } else {
                                let index = find(value: "Diving", in: selectedTravel)
                                    selectedTravel.remove(at: index!)
                                }
                            } else if selectedFolder == "2" {
                                travels[2].selected.toggle()
                                if travels[2].selected == true {
                                    selectedTravel.append(travels[2].title)
                                } else {
                                let index = find(value: "Sport-tours", in: selectedTravel)
                                    selectedTravel.remove(at: index!)
                                }
                            } else if selectedFolder == "3" {
                                travels[3].selected.toggle()
                                if travels[3].selected == true {
                                    selectedTravel.append(travels[3].title)
                                } else {
                                let index = find(value: "Excursions", in: selectedTravel)
                                    selectedTravel.remove(at: index!)
                                }
                            } else if selectedFolder == "4" {
                                travels[4].selected.toggle()
                                if travels[4].selected == true {
                                    selectedTravel.append(travels[4].title)
                                } else {
                                let index = find(value: "Mountains", in: selectedTravel)
                                    selectedTravel.remove(at: index!)
                                }
                            } else if selectedFolder == "5" {
                                travels[5].selected.toggle()
                                if travels[5].selected == true {
                                    selectedTravel.append(travels[5].title)
                                } else {
                                let index = find(value: "Beach", in: selectedTravel)
                                    selectedTravel.remove(at: index!)
                                }
                        } else {
                            print("error")
                        }
                        UserDefaults.standard.set(selectedTravel, forKey: "userTravel")
                        } label: {
                        Image(systemName: travel.selected ? "checkmark.square.fill" : "square")
                    }
                    } .foregroundColor(Color.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(Constants.Colors.teal1!))
                    .cornerRadius(15)
                }
            }) .padding()
            Spacer(minLength: 0)
        }
    }
}
    func find(value searchValue: String, in array: [String]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == searchValue {
                return index
            }
        }
        return nil
    }
}
