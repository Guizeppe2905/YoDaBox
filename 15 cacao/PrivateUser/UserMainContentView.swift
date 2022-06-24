//
//  UserContentView.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 18.05.2022.
//

import SwiftUI

struct UserMainContentView: View {
    @AppStorage ("firstSwitchedOn") var firstSwitchedOn = false
    @AppStorage ("secondSwitchedOn") var secondSwitchedOn = false
    @AppStorage ("zeroSwitchedOn") var zeroSwitchedOn = false
    var body: some View {
        ZStack{
            VStack {
        Animation()
        NavBar()
        if firstSwitchedOn {
            Profile()
            Bottom()
        } else if secondSwitchedOn {
            Budget()
            Bottom()
        } else {
            Home()
            Bottom()
        }          
    }
        }
    }
}

