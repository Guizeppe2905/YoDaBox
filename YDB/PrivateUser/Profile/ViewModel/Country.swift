//
//  County.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 20.05.2022.
//

import SwiftUI

struct CountryView: View {
    @ObservedObject var userSetting = UserSettings()
    let countries = Locale.isoRegionCodes.compactMap{
        Country(id: $0, name: Locale.current.localizedString(forRegionCode: $0)!) }
    @State var selectedCountry: Country?
    var body: some View {
        var text = ""
        VStack {
            Picker("Country", selection: $userSetting.userCountry) {
        ForEach(getLocales(), id: \.id) { country in
                Text(country.name).tag(Optional(country))
            } 
            } .padding(.leading, -20)
            .pickerStyle(.wheel)
            .colorInvert()
            .colorMultiply(Color(Constants.Colors.primaryTeal!))
            .onChange(of: selectedCountry) { selected in
                if let cntry = selected {
        text = "Selected county: \(cntry.id)"
                }
            }
       Text(text)
        }
    }
}
