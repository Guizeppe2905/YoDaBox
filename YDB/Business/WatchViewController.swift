//
//  SettingsViewController.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 31.05.2022.
//

import UIKit
import AVFoundation

class WatchViewController: UIViewController {
    private lazy var videoLayer: UIView = {
        let videoLayer = UIView()
        videoLayer.addSubview(labelCompany)
        return videoLayer
   }()
    private lazy var labelCompany: UILabel = {
        let labelCompany = UILabel(frame: CGRect(x: 10, y: 700, width: 350, height: 100))
        labelCompany.textAlignment = .center
        labelCompany.numberOfLines = 0
        labelCompany.textColor = .white
        labelCompany.font = UIFont(name:"Avenir Next", size: 30)
        return labelCompany
    }()
    private lazy var labelSlogan: UILabel = {
        let labelSlogan = UILabel(frame: CGRect(x: 400, y: 700, width: 350, height: 100))
        labelSlogan.textAlignment = .center
        labelSlogan.numberOfLines = 0
        labelSlogan.textColor = .white
        labelSlogan.font = UIFont(name:"Avenir Next", size: 30)
        return labelSlogan
    }()
    private lazy var labelBrand: UILabel = {
        let labelBrand = UILabel(frame: CGRect(x: 400, y: 700, width: 350, height: 100))
        labelBrand.textAlignment = .center
        labelBrand.numberOfLines = 0
        labelBrand.textColor = .white
        labelBrand.font = UIFont(name:"Avenir Next", size: 30)
        return labelBrand
    }()
    private lazy var labelWebsite: UILabel = {
        let labelWebsite = UILabel(frame: CGRect(x: 400, y: 700, width: 350, height: 100))
        labelWebsite.textAlignment = .center
        labelWebsite.numberOfLines = 0
        labelWebsite.textColor = .white
        labelWebsite.font = UIFont(name:"Avenir Next", size: 30)
        return labelWebsite
    }()
    private lazy var labelBuy: UILabel = {
        let labelBuy = UILabel(frame: CGRect(x: 400, y: 700, width: 350, height: 100))
        labelBuy.textAlignment = .center
        labelBuy.numberOfLines = 0
        labelBuy.textColor = .white
        labelBuy.font = UIFont(name:"Avenir Next", size: 30)
        return labelBuy
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        view.addSubview(videoLayer)
        view.addSubview(labelSlogan)
        view.addSubview(labelBrand)
        view.addSubview(labelWebsite)
        view.addSubview(labelBuy)
    }
    override func viewWillAppear(_ animated: Bool) {
        labelCompany.text = "\(UserDefaults.standard.string(forKey: "companyName") ?? "Your Company Name")"
        labelSlogan.text = UserDefaults.standard.string(forKey: "slogan")
        labelBrand.text = "Our company produces \(UserDefaults.standard.string(forKey: "brand") ?? "best quality production")"
        labelBuy.text = "You can buy it at \(UserDefaults.standard.string(forKey: "buy") ?? "our website")"
        labelWebsite.text = "\(UserDefaults.standard.string(forKey: "website") ?? "") visit us!"
        playVideo()
        animateLabels()
    }
    private func playVideo() {
        var path = Bundle.main.path(forResource: "", ofType: "")
        if UserDefaults.standard.string(forKey: "industry") == "IT" {
        path = Bundle.main.path(forResource: "it", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Medicine" {
        path = Bundle.main.path(forResource: "medicine", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Science" {
        path = Bundle.main.path(forResource: "science", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Food" {
        path = Bundle.main.path(forResource: "cooking", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Sport" {
        path = Bundle.main.path(forResource: "sport", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Construction" {
        path = Bundle.main.path(forResource: "construction", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Travel" {
        path = Bundle.main.path(forResource: "beach", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Media" {
        path = Bundle.main.path(forResource: "media", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Beauty" {
        path = Bundle.main.path(forResource: "makeup2", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Cars" {
        path = Bundle.main.path(forResource: "cars", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Pets" {
        path = Bundle.main.path(forResource: "dog", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Diving" {
        path = Bundle.main.path(forResource: "diving", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Movies" {
        path = Bundle.main.path(forResource: "movies", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Games" {
        path = Bundle.main.path(forResource: "games", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Fashion" {
        path = Bundle.main.path(forResource: "fashion", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Gardening" {
        path = Bundle.main.path(forResource: "garden", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Repair" {
        path = Bundle.main.path(forResource: "repair", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Home Design" {
        path = Bundle.main.path(forResource: "homedesign", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Flowers" {
        path = Bundle.main.path(forResource: "flowers", ofType: "mp4")
        } else if UserDefaults.standard.string(forKey: "industry") == "Fishing" {
        path = Bundle.main.path(forResource: "fishing", ofType: "mp4")
            } else {
                print("error")
            }
        let player = AVPlayer(url: URL(fileURLWithPath: (path ?? Bundle.main.path(forResource: "fashion", ofType: "mp4"))!))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        self.videoLayer.layer.addSublayer(playerLayer)
        player.play()
        videoLayer.bringSubviewToFront(labelCompany)
    }
    private func animateLabels() {
        UIView.animate(withDuration: 0.1, delay: 1.5) { [weak self] in
        guard let self = self else { return }
            self.labelCompany.transform = CGAffineTransform(translationX: -790, y: 0)
        }
        UIView.animate(withDuration: 2, delay: 1.6) { [weak self] in
        guard let self = self else { return }
            self.labelSlogan.transform = CGAffineTransform(translationX: -390, y: 0)
        }
        UIView.animate(withDuration: 1, delay: 4.1) { [weak self] in
        guard let self = self else { return }
            self.labelSlogan.transform = CGAffineTransform(translationX: -790, y: 0)
        }
        UIView.animate(withDuration: 2, delay: 4.3) { [weak self] in
        guard let self = self else { return }
            self.labelBrand.transform = CGAffineTransform(translationX: -390, y: 0)
        }
        UIView.animate(withDuration: 1, delay: 7.1) { [weak self] in
        guard let self = self else { return }
            self.labelBrand.transform = CGAffineTransform(translationX: -790, y: 0)
        }
        UIView.animate(withDuration: 2, delay: 7.3) { [weak self] in
        guard let self = self else { return }
            self.labelBuy.transform = CGAffineTransform(translationX: -390, y: 0)
        }
        UIView.animate(withDuration: 1, delay: 10.1) { [weak self] in
        guard let self = self else { return }
            self.labelBuy.transform = CGAffineTransform(translationX: -790, y: 0)
        }
        UIView.animate(withDuration: 2, delay: 10.3) { [weak self] in
        guard let self = self else { return }
            self.labelWebsite.transform = CGAffineTransform(translationX: -390, y: 0)
        }
      UIView.animate(withDuration: 1, delay: 13.5) { [weak self] in
        guard let self = self else { return }
            self.labelWebsite.transform = CGAffineTransform(translationX: -790, y: 0)
        }
        UIView.animate(withDuration: 0.0001, delay: 14.5) { [weak self] in
        guard let self = self else { return }
            self.labelBuy.transform = .identity
            self.labelSlogan.transform = .identity
            self.labelCompany.transform = .identity
            self.labelWebsite.transform = .identity
            self.labelBrand.transform = .identity
            self.labelBuy.transform = .identity
            self.labelSlogan.transform = .identity
        }
    }
}
