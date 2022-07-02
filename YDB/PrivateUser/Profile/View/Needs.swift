//
//  Needs.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 24.05.2022.
//

import SwiftUI

struct NeedsView: View {
    @ObservedObject var viewModel = ViewModel()
    @ObservedObject var userSetting = UserSettings()
    @State var selectedNeeds: [String] = []
    @State var selectedFolder = ""
    @State var needs = [
        ProfileDetailsModel(id: 0, image: "door", title: "Household", selected: false),
        ProfileDetailsModel(id: 1, image: "o2", title: "Healthcare", selected: false),
        ProfileDetailsModel(id: 2, image: "decor", title: "Home design", selected: false),
        ProfileDetailsModel(id: 3, image: "job1", title: "Trainings", selected: false),
        ProfileDetailsModel(id: 4, image: "sportsFan", title: "Sports fan", selected: false),
        ProfileDetailsModel(id: 5, image: "spa1", title: "Spa", selected: false)
]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
        VStack {
            Spacer()
            HStack {
                Spacer()
           Text("Extra interests & needs")
                .font(.custom("Avenir Next", size: 25))
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
            Text("Choose what you are keen on")
                .font(.custom("Avenir Next", size: 20))
                .foregroundColor(Color(Constants.Colors.primaryTeal!))
                .padding(.top, -10)
                .multilineTextAlignment(.leading)
            Spacer(minLength: 0)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 35, content: {
                ForEach(needs.reversed()) { need in
                    VStack(spacing: 15) {
                        Image(need.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                        HStack {
                        Text(need.title)
                            .font(.custom("Avenir Next", size: 16))
                            .fontWeight(.bold)
                        Button {
                            selectedFolder = "\(need.id)"
                            if selectedFolder == "0" {
                                needs[0].selected.toggle()
                                if needs[0].selected == true {
                                    selectedNeeds.append(needs[0].title)
                                } else {
                                let index = find(value: "Household", in: selectedNeeds)
                                    selectedNeeds.remove(at: index!)
                                }
                            } else if selectedFolder == "1" {
                                needs[1].selected.toggle()
                                if needs[1].selected == true {
                                    selectedNeeds.append(needs[1].title)
                                } else {
                                let index = find(value: "Healthcare", in: selectedNeeds)
                                    selectedNeeds.remove(at: index!)
                                }
                            } else if selectedFolder == "2" {
                                needs[2].selected.toggle()
                                if needs[2].selected == true {
                                    selectedNeeds.append(needs[2].title)
                                } else {
                                let index = find(value: "Home design", in: selectedNeeds)
                                    selectedNeeds.remove(at: index!)
                                }
                            } else if selectedFolder == "3" {
                                needs[3].selected.toggle()
                                if needs[3].selected == true {
                                    selectedNeeds.append(needs[3].title)
                                } else {
                                let index = find(value: "Trainings", in: selectedNeeds)
                                    selectedNeeds.remove(at: index!)
                                }
                            } else if selectedFolder == "4" {
                                needs[4].selected.toggle()
                                if needs[4].selected == true {
                                    selectedNeeds.append(needs[4].title)
                                } else {
                                let index = find(value: "Sports fan", in: selectedNeeds)
                                    selectedNeeds.remove(at: index!)
                                }
                            } else if selectedFolder == "5" {
                                needs[5].selected.toggle()
                                if needs[5].selected == true {
                                    selectedNeeds.append(needs[5].title)
                                } else {
                                let index = find(value: "Spa", in: selectedNeeds)
                                    selectedNeeds.remove(at: index!)
                                }
                        } else {
                            print("error")
                        }
                        UserDefaults.standard.set(selectedNeeds, forKey: "userNeeds")
                        } label: {
                        Image(systemName: need.selected ? "checkmark.square.fill" : "square")
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





