//
//  HomeViewModel.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 20.05.2022.
//

import SwiftUI

struct Home: View {
    @ObservedObject var viewModel = ViewModel()
    @State var showSheet: Bool = false
    @State var moveToForm = false
    var body: some View {
            ZStack {
                VStack {
                    Spacer()
                    HStack(alignment: .center, spacing: 10) {
                        Button(action: { self.viewModel.navigateToVC(WelcomeViewController()) }) {
                            HStack(alignment: .center) {
                                Spacer()
                Image(uiImage: Constants.Image.street!)
                    .resizable()
                    .shadow(radius: 35, y: 20)
                    .frame(width: 150, height: 180, alignment: .center)
                    .cornerRadius(15)
                    .overlay(viewModel.startOverlay, alignment: .bottom)
                            }}
                        Button(action: { self.viewModel.navigateToVC(ContainerViewController()) }) {
                            HStack(alignment: .center) {
                                Spacer()
                        Image(uiImage: Constants.Image.logo!)
                            .resizable()
                            .shadow(radius: 35, y: 20)
                            .frame(width: 150, height: 180, alignment: .center)
                            .cornerRadius(15)
                            .overlay(viewModel.businessOverlay, alignment: .bottom)
                            }
                        }
                    } .padding(.leading, 30)
                    .padding(.trailing, 30)
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: { self.viewModel.goIntro() }) {
                            HStack(alignment: .center) {
                                Spacer()
                                Image(uiImage: Constants.Image.tshort6!)
                                    .resizable()
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .overlay(viewModel.introOverlay, alignment: .bottom)
                                Spacer()
                            }
                        }
                        Spacer()
                    }
                    Spacer()
                HStack{
            Button {
                showSheet.toggle()
            } label: {
                Text ("Get a hint")
                    .padding()
                    .foregroundColor(.white)
                    .font(.custom("Avenir Next", size: 18))
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color(Constants.Colors.primaryTeal!))
                    .shadow(color: Color(Constants.Colors.primaryTeal!).opacity(0.6), radius: 20, y: 20)
                    .cornerRadius(15)
            }
                .halfSheet(showSheet: $showSheet) {
                    Color(Constants.Colors.primaryTeal!)
                        .ignoresSafeArea()
                    VStack {
                        Spacer()
                        Image(uiImage: Constants.Image.yoda!)
                            .resizable()
                           .aspectRatio(contentMode: .fit)
                            .onTapGesture {
                                self.showSheet.toggle()
                                self.showSheet = false
                        }
                        Text("Hello Master YoDa,")
                                    .font(.custom("Avenir Next", size: 30))
                                    .foregroundColor(.white)
                                    .frame(width: 350, height: 40, alignment: .top)
                    Text("Welcome to User Mode of YoDa Box. YoDa Box means Your Data Box. Profile folder consists of your persnal settings and Balance folder is made to track the number of videos watched and amount of money earned. Press on the card there to see detailed view.")
                        .font(.custom("Avenir Next", size: 18))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
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
}
}
