//
//  ProfileViewController.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 20.05.2022.
//

import SwiftUI

struct Profile: View {
    @ObservedObject var viewModel = ViewModel()
    @ObservedObject var userSetting = UserSettings()
    @State var moveToForm = false
    @State var showSheet: Bool = false
    var body: some View {
            ZStack {
                VStack {
                    Spacer()
                    HStack(alignment: .center, spacing: 10) {
             ProfileFoldersView()
                    Spacer()
                    }
                    Spacer()
                    HStack {
                            Text("* Select folders to indicate additional info and receive only ads that are relevant to you")
                                .padding()
                                .frame(width: 350, height: 80, alignment: .bottom)
                                .font(.custom("Avenir Next", size: 14))
                                .foregroundColor(Color(Constants.Colors.primaryTeal!))
                                .multilineTextAlignment(.leading)
                        }
                    Button(action: { self.viewModel.goForm() }) {
                        HStack(alignment: .center) {
                            Spacer()
                            Text("Account")
                             .padding()
                             .foregroundColor(.white)
                             .font(.custom("Avenir Next", size: 18))
                              .frame(width: 300, height: 50, alignment: .center)
                              .background(Color(Constants.Colors.primaryTeal!))
                              .shadow(color: Color(Constants.Colors.primaryTeal!).opacity(0.6), radius: 20, y: 20)
                              .cornerRadius(15)
                            Spacer()
                        }
                    }
                    Spacer()
                    HStack{
            Button {
                showSheet.toggle()
            } label: {
                Text ("Check Your Data")
                    .padding()
                    .foregroundColor(.white)
                    .font(.custom("Avenir Next", size: 18))
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color(Constants.Colors.primaryTeal!))
                    .shadow(color: Color(Constants.Colors.primaryTeal!).opacity(0.6), radius: 20, y: 20)
                    .cornerRadius(15)
            }
                    } }
                .halfSheet(showSheet: $showSheet) {
                    Color(Constants.Colors.primaryTeal!)
                        .ignoresSafeArea()
                    VStack {
                        Image(uiImage: Constants.Image.yoda!)
                            .resizable()
                           .aspectRatio(contentMode: .fit)
                            .onTapGesture {
                                self.showSheet.toggle()
                                self.showSheet = false
                       }
                        if userSetting.username.isEmpty == true && userSetting.userLastname.isEmpty == true  {
                            Text("Hello Master Yoda!")
                                .font(.custom("Avenir Next", size: 18))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        } else {
                            Text("Hello \(userSetting.username) \(userSetting.userLastname)!")
                                .font(.custom("Avenir Next", size: 18))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center) }
                        Spacer()
                        VStack{
                            let formattedJobs = userSetting.userOccupation.map{String(describing:$0)}.joined(separator: ", ")
                            let formattedPets = userSetting.userPets.map{String(describing:$0)}.joined(separator: ", ")
                            let formattedTravel = userSetting.userTravel.map{String(describing:$0)}.joined(separator: ", ")
                            let formattedHobby = userSetting.userHobby.map{String(describing:$0)}.joined(separator: ", ")
                            let formattedFood = userSetting.userFood.map{String(describing:$0)}.joined(separator: ", ")
                            let formattedNeeds = userSetting.userNeeds.map{String(describing:$0)}.joined(separator: ", ")
                            Text("Birthday: \(userSetting.formattedBirthday)")
                            Text("Country: \(userSetting.userCountry)")
                            Text("City: \(userSetting.userCity)")
                            Text("Occupation: \(String(describing: formattedJobs))")
                            Text("Pets: \(String(describing: formattedPets))")
                            Text("Hobby: \(String(describing: formattedHobby))")
                            Text("Travel: \(String(describing: formattedTravel))")
                            Text("Food: \(String(describing: formattedFood))")
                            Text("Other interests: \(String(describing: formattedNeeds))")
                        }
                        .font(.custom("Avenir Next", size: 18))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        Button(action: {
                            self.moveToForm.toggle()
                        }) {
                               Text("Fill in the form")
                                   .foregroundColor(Color(Constants.Colors.sand2!))
                                   .underline()
                                   .font(.custom("Avenir Next", size: 18))
                                 .frame(width: 300, height: 20, alignment: .center)
                        } .sheet(isPresented: $moveToForm) {
                        FormContentView()
                           }
                } 
                }
                }
                }
            }


