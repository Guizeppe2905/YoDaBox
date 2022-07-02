//
//  SignInViewController.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 01.06.2022.
//

import UIKit
import SwiftUI

class SignInViewController: UIViewController {
    @ObservedObject var viewModel = ViewModel()
    @ObservedObject var userSetting = UserSettings()
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name:"Avenir Next", size: 25)
        titleLabel.text = "Welcome back to YoDa Box"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    private let titleAlert: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name:"Avenir Next", size: 18)
        titleLabel.text = "You've entered a wrong email or password. Please make sure you have a registered YoDa Box Account in Profile Settings or try again to log in."
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    private lazy var container: UIView = {
        let container = UIView()
        container.backgroundColor = Constants.Colors.primaryTeal
        container.layer.cornerRadius = 25
        container.addSubview(titleLabel)
        container.addSubview(labelEmail)
        container.addSubview(emailTextField)
        container.addSubview(labelPassword)
        container.addSubview(passwordTextField)
        container.addSubview(button)
        container.addSubview(buttonLock)
        return container
    }()
    private lazy var alertContainer: UIView = {
        let alertContainer = UIView()
        alertContainer.backgroundColor = Constants.Colors.teal1
        alertContainer.layer.cornerRadius = 25
        alertContainer.alpha = 0
        alertContainer.addSubview(titleAlert)
        alertContainer.addSubview(buttonOk)
        return alertContainer
    }()
    private let labelEmail: UILabel = {
        let labelEmail = UILabel()
        labelEmail.numberOfLines = 0
        labelEmail.font = .systemFont(ofSize: 14, weight: .semibold)
        labelEmail.textColor = .white
        labelEmail.text = "Email"
        return labelEmail
    }()
    private let emailTextField: UITextField = {
        let emailTextField =  CustomTextField()
        emailTextField.placeholder = "Enter email"
        emailTextField.autocapitalizationType = .none
        return emailTextField
    }()
    private let labelPassword: UILabel = {
        let labelPassword = UILabel()
        labelPassword.numberOfLines = 0
        labelPassword.font = .systemFont(ofSize: 14, weight: .semibold)
        labelPassword.textColor = .white
        labelPassword.text = "Password"
        return labelPassword
    }()
    private let passwordTextField: UITextField = {
        let passwordTextField =  CustomTextField()
        passwordTextField.placeholder = "Enter password"
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    private let button: UIButton = {
        let button = CustomButton(frame: CGRect(x: 100, y: 380, width: 150, height: 150))
        button.setTitle("Enter", for: .normal)
        button.layer.borderWidth = 1
        let myColor = UIColor.white
        button.layer.borderColor = myColor.cgColor
        button.titleLabel?.font = UIFont(name:"Avenir Next", size: 25)
        return button
    }()
    private let buttonOk: UIButton = {
        let buttonOk = UIButton()
        buttonOk.setTitle("OK", for: .normal)
        buttonOk.backgroundColor = Constants.Colors.primaryTeal
        buttonOk.titleLabel?.textAlignment = .center
        buttonOk.layer.cornerRadius = 25
        buttonOk.setTitleColor(.white, for: .normal)
        buttonOk.titleLabel?.font = UIFont(name:"Avenir Next", size: 14)
        return buttonOk
    }()
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.Image.screen
        imageView.contentMode = .scaleAspectFill
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = imageView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.layer.cornerRadius = 25
        blurEffectView.layer.cornerRadius = 25
        imageView.addSubview(blurEffectView)
       return imageView
   }()
    private lazy var buttonLock: UIButton = {
        let buttonLock = UIButton(type: .custom)
        buttonLock.setImage(UIImage(systemName: "lock.slash.fill"), for: .normal)
        buttonLock.tintColor = Constants.Colors.primaryTeal
        return buttonLock
    }()
    var pressed: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        view.addSubview(container)
        view.addSubview(alertContainer)
        setupConstraints()
        container.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeSignIn)))
        alertContainer.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeAlert)))
        passwordTextField.rightViewMode = .unlessEditing
        passwordTextField.rightView = buttonLock
        passwordTextField.rightViewMode = .always
        button.addTarget(self,
                                  action: #selector(logCheckUp),
                         for: .touchUpInside)
        buttonOk.addTarget(self,
                                 action: #selector(closeAlert),
                        for: .touchUpInside)
        buttonLock.addTarget(self,
                                 action: #selector(didTapButtonLock),
                        for: .touchUpInside)
    }
    @objc func didTapButtonLock(_ sender: Any) {
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected {
            pressed = true
            buttonLock.setImage(UIImage(systemName: "lock.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            pressed = false
            buttonLock.setImage(UIImage(systemName: "lock.slash.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
    }
    @objc private func closeSignIn() {
            navigationController?.popViewController(animated: false)
        }
     private func createAlert() {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.alertContainer.alpha = 1
            })
        }
        @objc private func closeAlert() {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.alertContainer.alpha = 0
            })
        }
        @objc private func logCheckUp() {
            if emailTextField.text == "" || passwordTextField.text == "" {
                createAlert()
            } else if emailTextField.text == userSetting.userEmail && passwordTextField.text == userSetting.userPassword {
                viewModel.goBack()
            } else {
                createAlert()
            }
        }
        func setupConstraints() {
            container.snp.makeConstraints{ make in
                make.height.equalTo(500)
                make.width.equalTo(350)
                make.top.equalToSuperview().offset(200)
                make.leading.equalToSuperview().offset(20)
            }
            titleLabel.snp.makeConstraints{ make in
                make.height.equalTo(150)
                make.width.equalTo(310)
                make.top.equalToSuperview().offset(20)
                make.centerXWithinMargins.equalTo(container.snp_centerXWithinMargins)
            }
            labelEmail.snp.makeConstraints{ make in
                make.height.equalTo(50)
                make.width.equalTo(100)
                make.leading.equalTo(container.snp.leading).offset(20)
                make.top.equalTo(container.snp.top).offset(150)
         }
            emailTextField.snp.makeConstraints{ make in
                make.height.equalTo(40)
                make.width.equalTo(300)
                make.leading.equalTo(container.snp.leading).offset(20)
                make.top.equalTo(container.snp.top).offset(210)
         }
            labelPassword.snp.makeConstraints{ make in
                make.height.equalTo(50)
                make.width.equalTo(100)
                make.leading.equalTo(container.snp.leading).offset(20)
                make.top.equalTo(container.snp.top).offset(260)
         }
            passwordTextField.snp.makeConstraints{ make in
                make.height.equalTo(40)
                make.width.equalTo(300)
                make.leading.equalTo(container.snp.leading).offset(20)
                make.top.equalTo(container.snp.top).offset(310)
         }
            imageView.snp.makeConstraints{ make in
                make.leading.equalToSuperview().offset(-10)
                make.top.equalToSuperview().offset(-10)
                make.trailing.equalToSuperview().offset(10)
                make.bottom.equalToSuperview().offset(10)
              }
            alertContainer.snp.makeConstraints{ make in
                make.height.equalTo(220)
                make.width.equalTo(380)
                make.top.equalToSuperview().offset(350)
                make.centerXWithinMargins.equalTo(container.snp_centerXWithinMargins)
            }
            titleAlert.snp.makeConstraints{ make in
                make.height.equalTo(150)
                make.width.equalTo(360)
                make.top.equalToSuperview().offset(2)
                make.centerXWithinMargins.equalTo(container.snp_centerXWithinMargins)
            }
            buttonOk.snp.makeConstraints{ make in
                make.height.equalTo(50)
                make.width.equalTo(280)
                make.top.equalToSuperview().offset(160)
                make.centerXWithinMargins.equalTo(container.snp_centerXWithinMargins)
            }
        }
    }
