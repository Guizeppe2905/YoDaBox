//
//  ContainerViewController.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 28.05.2022.
//
import UIKit

class ContainerViewController: UIViewController {
    enum MenuState {
        case opened
        case closed
    }
    private var menuState: MenuState = .closed
    let menuVC = MenuViewController()
    let homeVC = HomeViewController()
    var naviVC: UINavigationController?
    let adVC = AdViewController()
    let profileVC = ProfileViewController()
    let infoVC = InfoViewController()
    let watchVC = WatchViewController()
    override func viewDidLoad() {
         super.viewDidLoad()
            addChildVC()
    }
    private func addChildVC() {
        menuVC.delegate = self
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        homeVC.delegate = self
        let naviVC = UINavigationController(rootViewController: homeVC)
        addChild(naviVC)
        view.addSubview(naviVC.view)
        naviVC.didMove(toParent: self)
        self.naviVC = naviVC
    }
}
extension ContainerViewController: HomeViewControllerDelegate {
    func didTapButtonMenu() {
  toggleMenu(completion: nil)
}
    func toggleMenu(completion: (() -> Void)?) {
        switch menuState {
        case .closed:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.naviVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 150
            } completion: { [weak self] (done) in
                if done {
                    self?.menuState = .opened
                }
            }
        case .opened:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.naviVC?.view.frame.origin.x = 0
            } completion: { [weak self] (done) in
                if done {
                    self?.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
        }
    }
    }
}
extension ContainerViewController: MenuViewControllerDelegate {
    func didSelect(menuItem: MenuViewController.MenuOption) {
        toggleMenu(completion: nil)
        switch menuItem {
            
        case .home:
            self.backHome()
        case .profile:
            self.addProfile()
        case .ad:
            self.addCreateAd()
        case .info:
            self.addInfo()
        case .settings:
            self.addSettings()
        }
        }
    func addProfile() {
        let profile = profileVC
        homeVC.addChild(profile)
        adVC.view.removeFromSuperview()
        adVC.didMove(toParent: nil)
        homeVC.view.addSubview(profile.view)
        profile.view.frame = view.frame
        profile.didMove(toParent: homeVC)
        homeVC.title = profile.title
    }
    func addCreateAd() {
        let ad = adVC
        homeVC.addChild(ad)
        profileVC.view.removeFromSuperview()
        profileVC.didMove(toParent: nil)
        homeVC.view.addSubview(ad.view)
        ad.view.frame = view.frame
        ad.didMove(toParent: homeVC)
        homeVC.title = ad.title
    }
    func addInfo() {
        let info = infoVC
        homeVC.addChild(info)
        infoVC.view.removeFromSuperview()
        infoVC.didMove(toParent: nil)
        homeVC.view.addSubview(info.view)
        info.view.frame = view.frame
        info.didMove(toParent: homeVC)
        homeVC.title = info.title
    }
    func addSettings() {
        let watch = watchVC
        homeVC.addChild(watch)
        watchVC.view.removeFromSuperview()
        watchVC.didMove(toParent: nil)
        homeVC.view.addSubview(watch.view)
        watch.view.frame = view.frame
        watch.didMove(toParent: homeVC)
        homeVC.title = watch.title
    }
    func backHome() {
        adVC.view.removeFromSuperview()
        adVC.didMove(toParent: nil)
        profileVC.view.removeFromSuperview()
        profileVC.didMove(toParent: nil)
        infoVC.view.removeFromSuperview()
        infoVC.didMove(toParent: nil)
        watchVC.view.removeFromSuperview()
        watchVC.didMove(toParent: nil)
        homeVC.title = "Home"
    }
        }
    

