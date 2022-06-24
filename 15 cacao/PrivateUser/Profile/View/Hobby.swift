//
//  Hobby.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 24.05.2022.
//

import SwiftUI

struct HobbyView: View {
    @ObservedObject var userSetting = UserSettings()
    @State var selectedHobby: [String] = []
    @State var selectedFolder = ""
    @State var hobbies = [
        ProfileDetailsModel(id: 0, image: "diving", title: "Diving", selected: false),
        ProfileDetailsModel(id: 1, image: "gardening", title: "Gardening", selected: false),
        ProfileDetailsModel(id: 2, image: "games", title: "Games", selected: false),
        ProfileDetailsModel(id: 3, image: "spicies", title: "Cooking", selected: false),
        ProfileDetailsModel(id: 4, image: "o6", title: "Sport", selected: false),
        ProfileDetailsModel(id: 5, image: "fashion", title: "Shopping", selected: false),
        ProfileDetailsModel(id: 6, image: "fishing1", title: "Fishing", selected: false),
        ProfileDetailsModel(id: 7, image: "movies", title: "Movies", selected: false)
   
]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
        VStack {
            Spacer()
            HStack {
                Spacer()
           Text("Hobby")
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
            Text("Indicate your hobby")
                .font(.custom("Avenir Next", size: 20))
                .foregroundColor(Color(Constants.Colors.primaryTeal!))
                .padding(.top, -10)
                .multilineTextAlignment(.leading)
            Spacer(minLength: 0)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 35, content: {
                ForEach(hobbies.reversed()) { hobby in
                    VStack(spacing: 15) {
                        Image(hobby.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                        HStack {
                        Text(hobby.title)
                            .font(.custom("Avenir Next", size: 16))
                            .fontWeight(.bold)
                        Button {
                            selectedFolder = "\(hobby.id)"
                            if selectedFolder == "0" {
                                hobbies[0].selected.toggle()
                                if hobbies[0].selected == true {
                                    selectedHobby.append(hobbies[0].title)
                                } else {
                                let index = find(value: "Diving", in: selectedHobby)
                                    selectedHobby.remove(at: index!)
                                }
                            } else if selectedFolder == "1" {
                                hobbies[1].selected.toggle()
                                if hobbies[1].selected == true {
                                    selectedHobby.append(hobbies[1].title)
                                } else {
                                let index = find(value: "Gardening", in: selectedHobby)
                                    selectedHobby.remove(at: index!)
                                }
                            } else if selectedFolder == "2" {
                                hobbies[2].selected.toggle()
                                if hobbies[2].selected == true {
                                    selectedHobby.append(hobbies[2].title)
                                } else {
                                let index = find(value: "Games", in: selectedHobby)
                                    selectedHobby.remove(at: index!)
                                }
                            } else if selectedFolder == "3" {
                                hobbies[3].selected.toggle()
                                if hobbies[3].selected == true {
                                    selectedHobby.append(hobbies[3].title)
                                } else {
                                let index = find(value: "Cooking", in: selectedHobby)
                                    selectedHobby.remove(at: index!)
                                }
                            } else if selectedFolder == "4" {
                                hobbies[4].selected.toggle()
                                if hobbies[4].selected == true {
                                    selectedHobby.append(hobbies[4].title)
                                } else {
                                let index = find(value: "Sport", in: selectedHobby)
                                    selectedHobby.remove(at: index!)
                                }
                            } else if selectedFolder == "5" {
                                hobbies[5].selected.toggle()
                                if hobbies[5].selected == true {
                                    selectedHobby.append(hobbies[5].title)
                                } else {
                                let index = find(value: "Shopping", in: selectedHobby)
                                    selectedHobby.remove(at: index!)
                                }
                            } else if selectedFolder == "6" {
                                hobbies[6].selected.toggle()
                                if hobbies[6].selected == true {
                                    selectedHobby.append(hobbies[6].title)
                                } else {
                                let index = find(value: "Fishing", in: selectedHobby)
                                    selectedHobby.remove(at: index!)
                                }
                            } else if selectedFolder == "7" {
                                hobbies[7].selected.toggle()
                                if hobbies[7].selected == true {
                                    selectedHobby.append(hobbies[7].title)
                                } else {
                                let index = find(value: "Movies", in: selectedHobby)
                                    selectedHobby.remove(at: index!)
                                }
                        } else {
                            print("error")
                        }
                        UserDefaults.standard.set(selectedHobby, forKey: "userHobby")
                        } label: {
                        Image(systemName: hobby.selected ? "checkmark.square.fill" : "square")
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



