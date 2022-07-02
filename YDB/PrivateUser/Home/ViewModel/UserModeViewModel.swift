//
//  ViewModel.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 01.07.2022.
//

import SwiftUI
import UIKit

class ViewModel: ObservableObject {
    @Published var startOverlay = StartOverlayModel()
    @Published var businessOverlay = BusinessOverlayModel()
    @Published var introOverlay = IntroOverlayModel()
    @Published var backOverlay = BackOverlayModel()
   
    func goBack() {
         let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        keyWindow!.rootViewController = UIHostingController(rootView: UserMainContentView())
        keyWindow!.makeKeyAndVisible()
    }
    func navigateToVC(_ vc: UIViewController) {
        let keyWindow = UIApplication.shared.connectedScenes
           .filter({$0.activationState == .foregroundActive})
           .map({$0 as? UIWindowScene})
           .compactMap({$0})
           .first?.windows
           .filter({$0.isKeyWindow}).first
        keyWindow!.rootViewController = UINavigationController(rootViewController: vc)
        keyWindow!.makeKeyAndVisible()
    }
    func goForm() {
         let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        keyWindow!.rootViewController = UIHostingController(rootView: FormContentView())
        keyWindow!.makeKeyAndVisible()
    }
    func goIntro() {
         let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        keyWindow!.rootViewController = UIHostingController(rootView: Intro())
        keyWindow!.makeKeyAndVisible()
    }
}
