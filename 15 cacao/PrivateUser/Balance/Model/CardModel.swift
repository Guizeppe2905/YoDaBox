//
//  CardView.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 25.05.2022.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID().uuidString
    var cardHolder: String
    var cardNumber: String
    var cardValidity: String
    var cardImage: String
}
var cards = [
    Card(cardHolder: "J.Jackson", cardNumber: "1928 7832 9238 1218", cardValidity: "21-03-2025" ,cardImage: "card3"),
    Card(cardHolder: "O.Obukhov", cardNumber: "1928 7832 9238 1218", cardValidity: "21-03-2025" ,cardImage: "card3"),
    Card(cardHolder: "N.Arbuzov", cardNumber: "1928 7832 9238 1218", cardValidity: "21-03-2025" ,cardImage: "card3")
]

