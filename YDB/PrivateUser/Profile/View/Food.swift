//
//  Food.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 24.05.2022.
//

import SwiftUI

struct FoodView: View {
    @ObservedObject var viewModel = ViewModel()
    @ObservedObject var userSetting = UserSettings()
    @State var selectedFood: [String] = []
    @State var selectedFolder = ""
    @State var foods = [
        ProfileDetailsModel(id: 0, image: "oriental", title: "Oriental", selected: false),
        ProfileDetailsModel(id: 1, image: "mexican", title: "Mexican", selected: false),
        ProfileDetailsModel(id: 2, image: "vegitarian", title: "Vegetarian", selected: false),
        ProfileDetailsModel(id: 3, image: "seafood", title: "Seafood", selected: false),
        ProfileDetailsModel(id: 4, image: "grill", title: "Grill", selected: false),
        ProfileDetailsModel(id: 5, image: "burger", title: "Burgers", selected: false),
        ProfileDetailsModel(id: 6, image: "pizza", title: "Italian", selected: false),
        ProfileDetailsModel(id: 7, image: "sushi", title: "Sushi", selected: false)
]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
        VStack {
            Spacer()
            HStack {
                Spacer()
           Text("Food")
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
            Text("What kind of food do you prefer?")
                .font(.custom("Avenir Next", size: 20))
                .foregroundColor(Color(Constants.Colors.primaryTeal!))
                .padding(.top, -10)
                .multilineTextAlignment(.leading)
            Spacer(minLength: 0)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 35, content: {
                ForEach(foods.reversed()) { food in
                    VStack(spacing: 15) {
                        Image(food.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                        HStack {
                        Text(food.title)
                            .font(.custom("Avenir Next", size: 16))
                            .fontWeight(.bold)
                        Button {
                            selectedFolder = "\(food.id)"
                            if selectedFolder == "0" {
                                foods[0].selected.toggle()
                                if foods[0].selected == true {
                                    selectedFood.append(foods[0].title)
                                } else {
                                let index = find(value: "Oriental", in: selectedFood)
                                    selectedFood.remove(at: index!)
                                }
                            }  else if selectedFolder == "1" {
                                foods[1].selected.toggle()
                                if foods[1].selected == true {
                                    selectedFood.append(foods[1].title)
                                } else {
                                let index = find(value: "Mexican", in: selectedFood)
                                    selectedFood.remove(at: index!)
                                }
                            }  else if selectedFolder == "2" {
                                foods[2].selected.toggle()
                                if foods[2].selected == true {
                                    selectedFood.append(foods[2].title)
                                } else {
                                let index = find(value: "Vegetarian", in: selectedFood)
                                    selectedFood.remove(at: index!)
                                }
                            }  else if selectedFolder == "3" {
                                foods[3].selected.toggle()
                                if foods[3].selected == true {
                                    selectedFood.append(foods[3].title)
                                } else {
                                let index = find(value: "Seafood", in: selectedFood)
                                    selectedFood.remove(at: index!)
                                }
                            }  else if selectedFolder == "4" {
                                foods[4].selected.toggle()
                                if foods[4].selected == true {
                                    selectedFood.append(foods[4].title)
                                } else {
                                let index = find(value: "Grill", in: selectedFood)
                                    selectedFood.remove(at: index!)
                                }
                            }  else if selectedFolder == "5" {
                                foods[5].selected.toggle()
                                if foods[5].selected == true {
                                    selectedFood.append(foods[5].title)
                                } else {
                                let index = find(value: "Burgers", in: selectedFood)
                                    selectedFood.remove(at: index!)
                                }
                            }  else if selectedFolder == "6" {
                                foods[6].selected.toggle()
                                if foods[6].selected == true {
                                    selectedFood.append(foods[6].title)
                                } else {
                                let index = find(value: "Italian", in: selectedFood)
                                    selectedFood.remove(at: index!)
                                }
                            }  else if selectedFolder == "7" {
                                foods[7].selected.toggle()
                                if foods[7].selected == true {
                                    selectedFood.append(foods[7].title)
                                } else {
                                let index = find(value: "Sushi", in: selectedFood)
                                    selectedFood.remove(at: index!)
                                }
                        } else {
                            print("error")
                        }
                        UserDefaults.standard.set(selectedFood, forKey: "userFood")
                        } label: {
                        Image(systemName: food.selected ? "checkmark.square.fill" : "square")
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




