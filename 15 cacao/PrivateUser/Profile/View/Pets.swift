//
//  Pets.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 24.05.2022.
//

import SwiftUI

struct PetsView: View {
    @ObservedObject var userSetting = UserSettings()
    @State var selectedPet: [String] = []
    @State var selectedFolder = ""
    @State var pets = [
        ProfileDetailsModel(id: 0, image: "rodants", title: "Rodants", selected: false),
        ProfileDetailsModel(id: 1, image: "tartle", title: "Turtle", selected: false),
        ProfileDetailsModel(id: 2, image: "bird", title: "Birds", selected: false),
        ProfileDetailsModel(id: 3, image: "fish", title: "Fishes", selected: false),
        ProfileDetailsModel(id: 4, image: "dog1", title: "Dog", selected: false),
        ProfileDetailsModel(id: 5, image: "cat", title: "Cat", selected: false)
]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
        VStack {
            Spacer()
            HStack {
                Spacer()
           Text("Pets")
                .font(.custom("Avenir Next", size: 32))
                .foregroundColor(Color(Constants.Colors.primaryTeal!))
                .padding(.top)
                .multilineTextAlignment(.leading)
                Button(action: closeForm) {
                    HStack(alignment: .center) {
                        Spacer()
                        Image(systemName: "xmark.circle")
                         .padding()
                         .foregroundColor(Color(Constants.Colors.primaryTeal!))
                    }
                }
                Spacer()
            } .padding(.leading, 10)
                .padding(.top, 30)
            Text("What pets do you have?")
                .font(.custom("Avenir Next", size: 20))
                .foregroundColor(Color(Constants.Colors.primaryTeal!))
                .padding(.top, -10)
                .multilineTextAlignment(.leading)
            Spacer(minLength: 0)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 35, content: {
                ForEach(pets.reversed()) { pet in
                    VStack(spacing: 15) {
                        Image(pet.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                        HStack {
                        Text(pet.title)
                            .font(.custom("Avenir Next", size: 16))
                            .fontWeight(.bold)
                        Button {
                            selectedFolder = "\(pet.id)"
                            if selectedFolder == "0" {
                                pets[0].selected.toggle()
                                if pets[0].selected == true {
                                    selectedPet.append(pets[0].title)
                                } else {
                                let index = find(value: "Rodants", in: selectedPet)
                                    selectedPet.remove(at: index!)
                                }
                            } else if selectedFolder == "1" {
                                pets[1].selected.toggle()
                                if pets[1].selected == true {
                                    selectedPet.append(pets[1].title)
                                } else {
                                let index = find(value: "Turtle", in: selectedPet)
                                    selectedPet.remove(at: index!)
                                }
                            } else if selectedFolder == "2" {
                                pets[2].selected.toggle()
                                if pets[2].selected == true {
                                    selectedPet.append(pets[2].title)
                                } else {
                                let index = find(value: "Birds", in: selectedPet)
                                    selectedPet.remove(at: index!)
                                }
                            } else if selectedFolder == "3" {
                                pets[3].selected.toggle()
                                if pets[3].selected == true {
                                    selectedPet.append(pets[3].title)
                                } else {
                                let index = find(value: "Fishes", in: selectedPet)
                                    selectedPet.remove(at: index!)
                                }
                            } else if selectedFolder == "4" {
                                pets[4].selected.toggle()
                                if pets[4].selected == true {
                                    selectedPet.append(pets[4].title)
                                } else {
                                let index = find(value: "Dog", in: selectedPet)
                                    selectedPet.remove(at: index!)
                                }
                            } else if selectedFolder == "5" {
                                pets[5].selected.toggle()
                                if pets[5].selected == true {
                                    selectedPet.append(pets[5].title)
                                } else {
                                let index = find(value: "Cat", in: selectedPet)
                                    selectedPet.remove(at: index!)
                                }
                        } else {
                            print("error")
                        }
                            UserDefaults.standard.set(selectedPet, forKey: "userPets")
                        } label: {
                        Image(systemName: pet.selected ? "checkmark.square.fill" : "square")
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
        } .background(.white).ignoresSafeArea()
}
    func find(value searchValue: String, in array: [String]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == searchValue {
                return index
            }
        }
        return nil
    }
    func closeForm() {
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
