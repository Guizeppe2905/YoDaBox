//
//  ViewController.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 21.02.2022.
//

import UIKit
import SnapKit
import SwiftUI

class WelcomeViewController: UIViewController {
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 185, width: 150, height: 150))
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = Constants.Colors.primaryTeal
        button.layer.cornerRadius = button.frame.width / 2
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name:"Avenir Next", size: 25)
        return button
    }()
    private let buttonUser: UIButton = {
        let buttonUser = UIButton()
        buttonUser.setTitle("Private user", for: .normal)
        buttonUser.backgroundColor = Constants.Colors.primaryTeal
        buttonUser.layer.cornerRadius = 25
        buttonUser.setTitleColor(.white, for: .normal)
        buttonUser.titleLabel?.font = UIFont(name:"Avenir Next", size: 14)
        return buttonUser
    }()
    private let buttonCompany: UIButton = {
        let buttonCompany = UIButton()
        buttonCompany.setTitle("Business", for: .normal)
        buttonCompany.backgroundColor = Constants.Colors.primaryTeal
        buttonCompany.layer.cornerRadius = 25
        buttonCompany.setTitleColor(.white, for: .normal)
        buttonCompany.titleLabel?.font = UIFont(name:"Avenir Next", size: 14)
        return buttonCompany
    }()
    private let signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.titleLabel?.textAlignment = .left
        signInButton.titleLabel?.font = UIFont(name:"Avenir Next", size: 14)
        let attributes: [NSAttributedString.Key: Any] = [
              .foregroundColor: UIColor.blue,
              .underlineStyle: NSUnderlineStyle.single.rawValue
          ]
        let attributedString = NSMutableAttributedString(string: "Sign In", attributes: attributes)
        signInButton.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
        return signInButton
    }()
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView()
       imageView.image = Constants.Image.welcome
        imageView.contentMode = .scaleAspectFill
       return imageView
   }()
    private lazy var cardView: UIView = {
       let cardView = UIView()
        cardView.clipsToBounds = true
        cardView.layer.cornerRadius = 75
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = welcomeView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        cardView.addSubview(blurEffectView)
        cardView.addSubview(buttonCompany)
        cardView.addSubview(buttonUser)
        cardView.addSubview(signInLabel)
        cardView.addSubview(signInButton)
       return cardView
   }()
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.primaryTeal
        label.font = UIFont(name:"Avenir Next", size: 30)
        label.text = "Secure Your Data"
        return label
    }()
    private lazy var labelTitle: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = Constants.Colors.sand1
        labelTitle.numberOfLines = 0
        labelTitle.textAlignment = .right
        labelTitle.font = UIFont(name:"Zapfino", size: 25)
        labelTitle.text = ""
        return labelTitle
    }()
    private let typingString = "Wherever you are ..."
    private lazy var welcomeView: UIView = {
        let welcomeView = UIView()
        welcomeView.clipsToBounds = true
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = welcomeView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        welcomeView.layer.cornerRadius = 25
        blurEffectView.layer.cornerRadius = 25
        welcomeView.addSubview(blurEffectView)
        return welcomeView
   }()
    private lazy var signInLabel: UILabel = {
        let signInLabel = UILabel()
        signInLabel.textColor = Constants.Colors.primaryTeal
        signInLabel.font = UIFont(name:"Avenir Next", size: 14)
        signInLabel.text = "Have account?"
        signInLabel.textAlignment = .right
        return signInLabel
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addSubview(welcomeView)
        stackView.addSubview(label)
        stackView.addSubview(button)
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.Colors.primaryTeal
        view.tintColor = .white
        view.addSubview(imageView)
        view.addSubview(stackView)
        view.addSubview(labelTitle)
        view.addSubview(cardView)
        setupConstraints()
       for i in [imageView, welcomeView, label, button] {
            i.alpha = 0
        }
        animateImage()
        button.addTarget(self,
                         action: #selector(didTapContinueButton),
                         for: .touchUpInside)
        signInButton.addTarget(self,
                         action: #selector(didTapSignInButton),
                         for: .touchUpInside)
    } 
    func animateView() {
        UIView.animate(withDuration: 1.5, animations: { [weak self] in
        guard let self = self else { return }
                    self.welcomeView.alpha = 1
                    self.stackView.transform = CGAffineTransform(translationX: 5, y: 650)
        }) { (true) in
            self.animateLabel()
        }
    }
    func animateLabel() {
        UIView.animate(withDuration: 1, animations: { [weak self] in
        guard let self = self else { return }
            self.label.alpha = 1
        }) { (true) in
            self.animateButton()
        }
    }
    func animateButton() {
        UIView.animate(withDuration: 0.5, delay: 0) { [weak self] in
        guard let self = self else { return }
            self.button.alpha = 1
        }
    }
    func animateImage() {
        UIView.animate(withDuration: 0.1, animations: { [weak self] in
        guard let self = self else { return }
            self.imageView.alpha = 1
            }) { (true) in
            self.animateTitle()
            }
    }
    func animateTitle() {
        UIView.animate(withDuration: 2, animations: { [weak self] in
        guard let self = self else { return }
            self.typingText()
        }) { (true) in
            self.animateView()
        }
}
    private func typingText() {
       guard var text = labelTitle.text else { return }
       for char in typingString {
           text += "\(char)"
           labelTitle.text = text
           RunLoop.current.run(until: Date() + 0.1)
       }
    }
    @objc func didTapContinueButton() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: { [weak self] in
    guard let self = self else { return }
            self.button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
     
    }) { (true) in
            self.button.transform = .identity
        }
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
        guard let self = self else { return }
            self.stackView.transform = CGAffineTransform(translationX: 5, y: 510)
            self.cardView.transform = CGAffineTransform(translationX: 0, y: -120)
        }) { (true) in
            self.button.setTitle("Choose mode", for: .normal)
            self.buttonUser.addTarget(self,
                            action: #selector(self.didTapUserButton),
                            for: .touchUpInside)
        }
            self.buttonCompany.addTarget(self,
                            action: #selector(self.didTapBusinessButton),
                            for: .touchUpInside)
    }
    @objc func didTapSignInButton() {
        let signInVC = SignInViewController()
        navigationController?.pushViewController(signInVC, animated: false)
    }
    @objc private func didTapUserButton() {
            let keyWindow = UIApplication.shared.connectedScenes
               .filter({$0.activationState == .foregroundActive})
               .map({$0 as? UIWindowScene})
               .compactMap({$0})
               .first?.windows
               .filter({$0.isKeyWindow}).first
           keyWindow!.rootViewController = UIHostingController(rootView: UserMainContentView())
           keyWindow!.makeKeyAndVisible()
    }
    @objc func didTapBusinessButton() {
        let keyWindow = UIApplication.shared.connectedScenes
           .filter({$0.activationState == .foregroundActive})
           .map({$0 as? UIWindowScene})
           .compactMap({$0})
           .first?.windows
           .filter({$0.isKeyWindow}).first
        keyWindow!.rootViewController = UINavigationController(rootViewController: ContainerViewController())
       keyWindow!.makeKeyAndVisible()
    }
   private func setupConstraints () {
      imageView.snp.makeConstraints{ make in
          make.leading.equalToSuperview().offset(-10)
          make.top.equalToSuperview().offset(-10)
          make.trailing.equalToSuperview().offset(10)
          make.bottom.equalToSuperview().offset(10)
        }
       stackView.snp.makeConstraints{ make in
           make.height.equalTo(350)
           make.width.equalTo(350)
           make.centerX.equalTo(self.view)
           make.top.equalToSuperview().offset(-195)
       }
       welcomeView.snp.makeConstraints{ make in
           make.height.equalTo(350)
           make.width.equalTo(350)
          make.leading.equalTo(stackView)
           make.top.equalTo(stackView)
       }
       label.snp.makeConstraints{ make in
           make.height.equalTo(85)
           make.centerX.equalTo(stackView.snp_centerXWithinMargins)
           make.bottom.equalTo(button.snp_topMargin).offset(-80)
       }
       labelTitle.snp.makeConstraints{ make in
           make.height.equalTo(250)
           make.width.equalTo(350)
           make.centerX.equalTo(stackView.snp_centerXWithinMargins)
           make.bottom.equalTo(imageView.snp_bottomMargin).offset(-550)
       }
       cardView.snp.makeConstraints{ make in
           make.height.equalTo(150)
           make.width.equalTo(400)
           make.centerX.equalTo(self.view)
           make.bottom.equalToSuperview().offset(150)
       }
       buttonUser.snp.makeConstraints{ make in
           make.height.equalTo(50)
           make.width.equalTo(145)
           make.leading.equalTo(cardView).offset(40)
           make.top.equalTo(cardView).offset(25)
       }
       buttonCompany.snp.makeConstraints{ make in
           make.height.equalTo(50)
           make.width.equalTo(145)
           make.trailing.equalTo(cardView).offset(-40)
           make.top.equalTo(cardView).offset(25)
       }
       signInLabel.snp.makeConstraints{ make in
           make.height.equalTo(40)
           make.width.equalTo(150)
           make.trailing.equalTo(cardView).offset(-185)
           make.bottom.equalTo(cardView).offset(-35)
       }
       signInButton.snp.makeConstraints{ make in
           make.height.equalTo(40)
           make.width.equalTo(50)
           make.leading.equalTo(cardView).offset(215)
           make.bottom.equalTo(cardView).offset(-35)
       }
    }
}
