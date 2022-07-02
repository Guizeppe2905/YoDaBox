//
//  FormContentView.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 20.05.2022.
//

import SwiftUI
import UIKit
import Combine

struct FormContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @ObservedObject var userSetting = UserSettings()
    @State private var birthdate = Date()
    @State private var numberOfAds = 10
    @State private var isSecured: Bool = true
    let coloredNavAppearance = UINavigationBarAppearance()
    init() {
            coloredNavAppearance.configureWithOpaqueBackground()
            coloredNavAppearance.backgroundColor = Constants.Colors.primaryTeal
            coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().standardAppearance = coloredNavAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
            UITableView.appearance().backgroundColor = .clear
        }
    var body: some View {
        NavigationView{
        Form {
            HStack  {
               Spacer()
            PhotoPicker()
               Spacer()
            }
            Section(header: HStack {
                Text("Personal Information")
                    .foregroundColor(.white)
            }) {
            TextField("First Name", text: $userSetting.username)
            TextField("Last Name", text: $userSetting.userLastname)
            TextField("Email", text: $userSetting.userEmail)
                .autocapitalization(.none)
                ZStack(alignment: .trailing) {
                Group {
                if isSecured {
            SecureField("Password", text: $userSetting.userPassword)
                } else {
            TextField("Password", text: $userSetting.userPassword)
                }
            Button(action: {
                               isSecured.toggle()
                           }) {
                               Image(systemName: self.isSecured ? "lock.slash.fill" : "lock.fill")
                           }
                }
                }
            DatePicker("Birthdate", selection: $userSetting.userBirthday, displayedComponents: .date)
                    .colorInvert()
                    .colorMultiply(Color(Constants.Colors.primaryTeal!))
                    .applyTextColor(Color(Constants.Colors.primaryTeal!))
            TextField("City", text: $userSetting.userCity)
            }
            Section(header: HStack {
                Text("Select your country")
                    .foregroundColor(.white)
            }) {
            CountryView()
            }
            Section(header: HStack {
                Text("Settings")
                    .foregroundColor(.white)
            })
            {
            Toggle("Switch on notifications", isOn: $userSetting.isPushed)
                    .toggleStyle(SwitchToggleStyle(tint: Color(Constants.Colors.primaryTeal!)))
            Stepper("Max number of ads per day", value: $numberOfAds, in: 1...100000)
            Text("You would like to receive maximum \(numberOfAds) ads per day.")
            Link("Terms of Service", destination: URL(string: "https://github.com/Guizeppe2905/")!)
            }
        } .padding()
        .background(Color(Constants.Colors.primaryTeal!))
        .foregroundColor(Color(Constants.Colors.primaryTeal!))
        .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    Button("Close", action: { self.viewModel.goBack() })
            }
            }
        } .accentColor(.white)
    }
    }
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
extension View {
  @ViewBuilder func applyTextColor(_ color: Color) -> some View {
    if UITraitCollection.current.userInterfaceStyle == .light {
      self.colorInvert().colorMultiply(color)
    } else {
      self.colorMultiply(color)
    }
  }
}
