//
//  Occupation.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 23.05.2022.
//

import SwiftUI

struct OccupationView: View {
    @ObservedObject var userSetting = UserSettings()
    @State var selectedJobs: [String] = []
    @State var selectedFolder = ""
    @State var occupations = [
        ProfileDetailsModel(id: 0, image: "diving", title: "Diving", selected: false),
        ProfileDetailsModel(id: 1, image: "repair1", title: "Repair", selected: false),
        ProfileDetailsModel(id: 2, image: "door", title: "Home Design", selected: false),
        ProfileDetailsModel(id: 3, image: "flowers", title: "Flowers", selected: false),
        ProfileDetailsModel(id: 4, image: "dog1", title: "Pets", selected: false),
        ProfileDetailsModel(id: 5, image: "games", title: "Games", selected: false),
        ProfileDetailsModel(id: 6, image: "fishing1", title: "Fishing", selected: false),
        ProfileDetailsModel(id: 7, image: "movies", title: "Movies", selected: false),
        ProfileDetailsModel(id: 8, image: "gardening", title: "Gardening", selected: false),
        ProfileDetailsModel(id: 9, image: "fashion", title: "Fashion", selected: false),
        ProfileDetailsModel(id: 10, image: "o10", title: "Cars", selected: false),
        ProfileDetailsModel(id: 11, image: "o3", title: "Beauty", selected: false),
        ProfileDetailsModel(id: 12, image: "o7", title: "Media", selected: false),
        ProfileDetailsModel(id: 13, image: "o4", title: "Travel", selected: false),
        ProfileDetailsModel(id: 14, image: "o8", title: "Construction", selected: false),
        ProfileDetailsModel(id: 15, image: "o6", title: "Sport", selected: false),
        ProfileDetailsModel(id: 16, image: "o5", title: "Food", selected: false),
        ProfileDetailsModel(id: 17, image: "o9", title: "Science", selected: false),
        ProfileDetailsModel(id: 18, image: "o2", title: "Medicine", selected: false),
        ProfileDetailsModel(id: 19, image: "o1", title: "IT", selected: false)
]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
        VStack {
            HStack {
                Spacer()
           Text("Occupation")
                .font(.custom("Avenir Next", size: 32))
                .foregroundColor(Color(Constants.Colors.primaryTeal!))
                .padding(.top)
                .multilineTextAlignment(.trailing)
                Button(action: closeForm) {
                    HStack(alignment: .bottom) {
                        Spacer()
                        Image(systemName: "xmark.circle")
                         .padding()
                         .foregroundColor(Color(Constants.Colors.primaryTeal!))
                    }
                }
                Spacer()
            } .padding(.leading, 10)
            Text("Choose the field you work in:")
                .font(.custom("Avenir Next", size: 20))
                .foregroundColor(Color(Constants.Colors.primaryTeal!))
                .padding(.top, -10)
                .multilineTextAlignment(.leading)
            Spacer(minLength: 0)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 35, content: {
                ForEach(occupations.reversed()) { occupation in
                    VStack(spacing: 15) {
                        Image(occupation.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                        HStack {
                        Text(occupation.title)
                            .font(.custom("Avenir Next", size: 16))
                            .fontWeight(.bold)
                        Button {
                            selectedFolder = "\(occupation.id)"
                        if selectedFolder == "0" {
                             occupations[0].selected.toggle()
                             if occupations[0].selected == true {
                                 selectedJobs.append(occupations[0].title)
                             } else {
                             let index = find(value: "Diving", in: selectedJobs)
                                 selectedJobs.remove(at: index!)
                             }
                        } else if selectedFolder == "1" {
                             occupations[1].selected.toggle()
                             if occupations[1].selected == true {
                                 selectedJobs.append(occupations[1].title)
                             } else {
                             let index = find(value: "Repair", in: selectedJobs)
                                 selectedJobs.remove(at: index!)
                             }
                        } else if selectedFolder == "2" {
                             occupations[2].selected.toggle()
                             if occupations[2].selected == true {
                                 selectedJobs.append(occupations[2].title)
                             } else {
                             let index = find(value: "Home Design", in: selectedJobs)
                                 selectedJobs.remove(at: index!)
                             }
                        } else if selectedFolder == "3" {
                             occupations[3].selected.toggle()
                             if occupations[3].selected == true {
                                 selectedJobs.append(occupations[3].title)
                             } else {
                             let index = find(value: "Flowers", in: selectedJobs)
                                 selectedJobs.remove(at: index!)
                             }
                        } else if selectedFolder == "4" {
                             occupations[4].selected.toggle()
                             if occupations[4].selected == true {
                                 selectedJobs.append(occupations[4].title)
                             } else {
                             let index = find(value: "Pets", in: selectedJobs)
                                 selectedJobs.remove(at: index!)
                             }
                        } else if selectedFolder == "5" {
                             occupations[5].selected.toggle()
                             if occupations[5].selected == true {
                                 selectedJobs.append(occupations[5].title)
                             } else {
                             let index = find(value: "Games", in: selectedJobs)
                                 selectedJobs.remove(at: index!)
                             }
                        } else if selectedFolder == "6" {
                             occupations[6].selected.toggle()
                             if occupations[6].selected == true {
                                 selectedJobs.append(occupations[6].title)
                             } else {
                             let index = find(value: "Fishing", in: selectedJobs)
                                 selectedJobs.remove(at: index!)
                             }
                        } else if selectedFolder == "7" {
                             occupations[7].selected.toggle()
                             if occupations[7].selected == true {
                                 selectedJobs.append(occupations[7].title)
                             } else {
                             let index = find(value: "Movies", in: selectedJobs)
                                 selectedJobs.remove(at: index!)
                             }
                        } else if selectedFolder == "8" {
                             occupations[8].selected.toggle()
                             if occupations[8].selected == true {
                                 selectedJobs.append(occupations[8].title)
                             } else {
                             let index = find(value: "Gardening", in: selectedJobs)
                                 selectedJobs.remove(at: index!)
                             }

                        } else if selectedFolder == "9" {
                             occupations[9].selected.toggle()
                             if occupations[9].selected == true {
                                 selectedJobs.append(occupations[9].title)
                             } else {
                             let index = find(value: "Fashion", in: selectedJobs)
                                 selectedJobs.remove(at: index!)
                             }
                        } else if selectedFolder == "10" {
                             occupations[10].selected.toggle()
                             if occupations[10].selected == true {
                                 selectedJobs.append(occupations[10].title)
                             } else {
                             let index = find(value: "Cars", in: selectedJobs)
                                 selectedJobs.remove(at: index!)
                             }
                         } else if selectedFolder == "11" {
                             occupations[11].selected.toggle()
                             if occupations[11].selected == true {
                                 selectedJobs.append(occupations[11].title)
                             } else {
                             let index = find(value: "Beauty", in: selectedJobs)
                                 selectedJobs.remove(at: index!)
                             }
                         } else if selectedFolder == "12" {
                             occupations[12].selected.toggle()
                             if occupations[12].selected == true {
                                 selectedJobs.append(occupations[12].title)
                             } else {
                             let index = find(value: "Media", in: selectedJobs)
                                 selectedJobs.remove(at: index!)
                             }
                        } else if selectedFolder == "13" {
                            occupations[13].selected.toggle()
                            if occupations[13].selected == true {
                                selectedJobs.append(occupations[13].title)
                            } else {
                            let index = find(value: "Travel", in: selectedJobs)
                                selectedJobs.remove(at: index!)
                            }
                        } else if selectedFolder == "14" {
                            occupations[14].selected.toggle()
                            if occupations[14].selected == true {
                                selectedJobs.append(occupations[14].title)
                            } else {
                            let index = find(value: "Construction", in: selectedJobs)
                                selectedJobs.remove(at: index!)
                            }
                        } else if selectedFolder == "15" {
                            occupations[15].selected.toggle()
                            if occupations[15].selected == true {
                                selectedJobs.append(occupations[15].title)
                            } else {
                            let index = find(value: "Sport", in: selectedJobs)
                                selectedJobs.remove(at: index!)
                            }
                        } else if selectedFolder == "16" {
                            occupations[16].selected.toggle()
                            if occupations[16].selected == true {
                                selectedJobs.append(occupations[16].title)
                            } else {
                            let index = find(value: "Food", in: selectedJobs)
                                selectedJobs.remove(at: index!)
                            }
                        } else if selectedFolder == "17" {
                            occupations[17].selected.toggle()
                            if occupations[17].selected == true {
                                selectedJobs.append(occupations[17].title)
                            } else {
                            let index = find(value: "Science", in: selectedJobs)
                                selectedJobs.remove(at: index!)
                            }
                        } else if selectedFolder == "18" {
                            occupations[18].selected.toggle()
                            if occupations[18].selected == true {
                                selectedJobs.append(occupations[18].title)
                            } else {
                            let index = find(value: "Medicine", in: selectedJobs)
                                selectedJobs.remove(at: index!)
                            }
                        } else if selectedFolder == "19" {
                            occupations[19].selected.toggle()
                            if occupations[19].selected == true {
                                selectedJobs.append(occupations[19].title)
                            } else {
                            let index = find(value: "IT", in: selectedJobs)
                                selectedJobs.remove(at: index!)
                            }
                        } else {
                            print("error")
                        }
                            UserDefaults.standard.set(selectedJobs, forKey: "userOccupation")
                        } label: {
                      Image(systemName: occupation.selected ? "checkmark.square.fill" : "square")
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


