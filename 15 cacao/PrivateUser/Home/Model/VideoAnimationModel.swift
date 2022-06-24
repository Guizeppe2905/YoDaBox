//
//  VideoAnimationModel.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 23.06.2022.
//

import UIKit

struct VideoAnimationModel: Identifiable {
    var id = UUID().uuidString
    var text: String
    var offset: CGFloat = 100
}
