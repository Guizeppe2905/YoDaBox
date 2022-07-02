//
//  CountryModel.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 20.05.2022.
//

import Foundation

struct Country: Identifiable, Hashable {
    let id: String
    let name: String
}
func getLocales() -> [Country] {
    let locales = Locale.isoRegionCodes
        .filter { $0 != "Russian Federation"}
        .compactMap { Country(id: $0, name: Locale.current.localizedString(forRegionCode: $0) ?? $0)}
    return [Country(id: "Rus", name: Locale.current.localizedString(forRegionCode: "Rus") ?? "Russian Federation")] + locales
}




