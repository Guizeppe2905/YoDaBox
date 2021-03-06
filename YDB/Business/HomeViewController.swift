//
//  HomeViewController.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 28.05.2022.
//

import UIKit
import SnapKit
import SwiftUI

protocol HomeViewControllerDelegate: AnyObject {
    func didTapButtonMenu()
}
class HomeViewController: UIViewController {
    weak var delegate: HomeViewControllerDelegate?
    @ObservedObject var viewModel = ViewModel()
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.Image.businessCard
        imageView.contentMode = .scaleAspectFill
       return imageView
   }()
    private lazy var buttonIntro: UIButton = {
        let buttonIntro = CustomButton(frame: CGRect(x: 140, y: 110, width: 90, height: 90))
        buttonIntro.setTitle("Intro", for: .normal)
        return buttonIntro
    }()
    private lazy var buttonSet: UIButton = {
        let buttonSet = CustomButton(frame: CGRect(x: 126, y: 100, width: 150, height: 150))
        buttonSet.setTitle(". . .", for: .normal)
        buttonSet.titleLabel?.font = UIFont(name:"Avenir Next", size: 25)
        return buttonSet
    }()
    private lazy var buttonSet1: UIButton = {
        let buttonSet1 = CustomButton(frame: CGRect(x: 126, y: 100, width: 150, height: 150))
        buttonSet1.setTitle(". . .", for: .normal)
        buttonSet1.titleLabel?.font = UIFont(name:"Avenir Next", size: 25)
        return buttonSet1
    }()
    private lazy var buttonUser: UIButton = {
        let buttonUser = CustomButton(frame: CGRect(x: 140, y: 110, width: 90, height: 90))
        buttonUser.setTitle("User Mode", for: .normal)
        return buttonUser
    }()
    private lazy var buttonStart: UIButton = {
        let buttonStart = CustomButton(frame: CGRect(x: 140, y: 110, width: 90, height: 90))
        buttonStart.setTitle("Back to Start", for: .normal)
        return buttonStart
    }()
    private lazy var buttonsStackView: UIStackView = {
        let buttonsStackView = UIStackView()
        buttonsStackView.axis = .horizontal
        buttonsStackView.addSubview(buttonStart)
        buttonsStackView.addSubview(buttonUser)
        buttonsStackView.addSubview(buttonIntro)
        buttonsStackView.addSubview(buttonSet)
        return buttonsStackView
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = stackView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        stackView.addSubview(blurEffectView)
        stackView.addSubview(label)
        stackView.alpha = 0
       return stackView
    }()
    private lazy var label: UILabel = {
        let label = CustomLabel()
        label.font = UIFont(name:"Avenir Next", size: 20)
        label.textAlignment = .natural
        label.text = "YoDa For Business \n 1. Select profile on the left side, fill in short form (5 secs). \n 2. Spend 3 seconds more on Create ad section. \n 3. Check Your Data at Info and your ad is ready. \n 4. Watch it and proceed to Private User mode. Select user's occupation to be the same industry you indicated here and User will watch your ad."
        return label
    }()
    private lazy var label1: UILabel = {
       let label1 = UILabel()
        label1.backgroundColor = .white
        label1.alpha = 0
        return label1
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(buttonsStackView)
        view.addSubview(label1)
        view.addSubview(stackView)
        setupConstraints()
        title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(barButtonTapped))
        buttonIntro.addTarget(self,
                         action: #selector(didTapIntroButton),
                         for: .touchUpInside)
        buttonSet.addTarget(self,
                         action: #selector(didTapSetButton),
                         for: .touchUpInside)
        buttonStart.addTarget(self,
                         action: #selector(didTapStartButton),
                         for: .touchUpInside)
        buttonUser.addTarget(self,
                         action: #selector(didTapUserButton),
                         for: .touchUpInside)
        buttonSet1.addTarget(self,
                         action: #selector(didTapSet1Button),
                         for: .touchUpInside)
        stackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeIntro)))
    }
    @objc func barButtonTapped() {
        delegate?.didTapButtonMenu()
    }
    @objc func didTapIntroButton() {
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
        guard let self = self else { return }
                    self.stackView.alpha = 1
                    self.label1.alpha = 1
        })
    }
    @objc func didTapSetButton() {
        let moveLeft = CGAffineTransform(translationX: -85, y: -60)
        let moveUp = CGAffineTransform(translationX: 15, y: -100)
        let moveRight = CGAffineTransform(translationX: 115, y: -60)
        self.buttonSet.removeFromSuperview()
        self.buttonsStackView.addSubview(self.buttonSet1)
        self.buttonSet1.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.5, delay: 0.2, animations: { [weak self] in
        guard let self = self else { return }
            self.buttonIntro.transform = moveLeft
            self.buttonUser.transform = moveLeft
            self.buttonStart.transform = moveLeft
        })
        UIView.animate(withDuration: 1.5, delay: 0.2, animations: { [weak self] in
        guard let self = self else { return }
            self.imageView.transform = CGAffineTransform(translationX: 0, y: -50)
        })
        UIView.animate(withDuration: 0.5, delay: 0.7, animations: { [weak self] in
        guard let self = self else { return }
            self.buttonIntro.transform = moveUp
            self.buttonStart.transform = moveUp
        })
        UIView.animate(withDuration: 0.5, delay: 1.2, animations: { [weak self] in
        guard let self = self else { return }
            self.buttonStart.transform = moveRight
        })
    }
    @objc func didTapStartButton() {
        viewModel.navigateToVC(WelcomeViewController())
    }
    @objc func didTapUserButton() {
        viewModel.goBack()
    }
    @objc func didTapSet1Button() {
        let moveLeft = CGAffineTransform(translationX: -85, y: -60)
        let moveUp = CGAffineTransform(translationX: 15, y: -100)
        self.buttonSet1.removeFromSuperview()
        self.buttonsStackView.addSubview(self.buttonSet)
        self.buttonSet.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.5, delay: 0.2, animations: { [weak self] in
        guard let self = self else { return }
            self.buttonStart.transform = moveUp
        })
        UIView.animate(withDuration: 1.5, delay: 0.2, animations: { [weak self] in
        guard let self = self else { return }
            self.imageView.transform = .identity
        })
        UIView.animate(withDuration: 0.5, delay: 0.7, animations: { [weak self] in
        guard let self = self else { return }
            self.buttonIntro.transform = moveLeft
            self.buttonStart.transform = moveLeft
        })
        UIView.animate(withDuration: 0.5, delay: 1.2, animations: { [weak self] in
        guard let self = self else { return }
            self.buttonUser.transform = .identity
            self.buttonStart.transform = .identity
            self.buttonIntro.transform = .identity
            self.buttonSet.transform = .identity
        })
    }
    @objc func closeIntro() {
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
        guard let self = self else { return }
                    self.stackView.alpha = 0
                    self.label1.alpha = 0
        })
    }
    private func setupConstraints () {
       imageView.snp.makeConstraints{ make in
           make.height.equalTo(300)
           make.width.equalTo(180)
           make.leading.equalToSuperview().offset(110)
           make.top.equalToSuperview().offset(200)
         }
        stackView.snp.makeConstraints{ make in
            make.width.equalTo(400)
            make.height.equalTo(900)
          }
        label1.snp.makeConstraints{ make in
            make.width.equalTo(300)
            make.height.equalTo(380)
            make.leading.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(240)
        }
        label.snp.makeConstraints{ make in
            make.width.equalTo(320)
            make.leading.equalToSuperview().offset(40)
            make.top.equalToSuperview().offset(250)
          }
        buttonsStackView.snp.makeConstraints{ make in
            make.width.equalTo(400)
            make.height.equalTo(400)
            make.leading.equalToSuperview().offset(0)
            make.top.equalToSuperview().offset(500)
        }
    }
}

