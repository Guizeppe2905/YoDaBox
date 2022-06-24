//
//  InfoViewController.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 28.05.2022.
//
import UIKit

class AdViewController: UIViewController {
    let defaults = UserDefaults.standard
    private let labelBrand: UILabel = {
        let labelBrand = UILabel()
        labelBrand.numberOfLines = 0
        labelBrand.font = .systemFont(ofSize: 14, weight: .semibold)
        labelBrand.textColor = Constants.Colors.primaryTeal
        labelBrand.text = "Brand name"
        return labelBrand
    }()
    private let brandTextField: UITextField = {
        let brandTextField =  UITextField()
                    brandTextField.placeholder = "Production for promotion"
                    brandTextField.font = UIFont(name:"Avenir Next", size: 14)
                    brandTextField.borderStyle = UITextField.BorderStyle.roundedRect
                    brandTextField.autocorrectionType = UITextAutocorrectionType.no
                    brandTextField.keyboardType = UIKeyboardType.default
                    brandTextField.returnKeyType = UIReturnKeyType.done
                    brandTextField.clearButtonMode = UITextField.ViewMode.whileEditing
                    brandTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                    brandTextField.textColor = Constants.Colors.primaryTeal
        return brandTextField
    }()
    private let labelSlogan: UILabel = {
        let labelSlogan = UILabel()
        labelSlogan.numberOfLines = 0
        labelSlogan.font = .systemFont(ofSize: 14, weight: .semibold)
        labelSlogan.textColor = Constants.Colors.primaryTeal
        labelSlogan.text = "Slogan"
        return labelSlogan
    }()
    private let sloganTextField: UITextField = {
        let sloganTextField =  UITextField()
                    sloganTextField.placeholder = "Enter your slogan"
                    sloganTextField.font = UIFont(name:"Avenir Next", size: 14)
                    sloganTextField.borderStyle = UITextField.BorderStyle.roundedRect
                    sloganTextField.autocorrectionType = UITextAutocorrectionType.no
                    sloganTextField.keyboardType = UIKeyboardType.default
                    sloganTextField.returnKeyType = UIReturnKeyType.done
                    sloganTextField.clearButtonMode = UITextField.ViewMode.whileEditing
                    sloganTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                    sloganTextField.textColor = Constants.Colors.primaryTeal
        return sloganTextField
    }()
    private let labelBuy: UILabel = {
        let labelBuy = UILabel()
        labelBuy.numberOfLines = 0
        labelBuy.font = .systemFont(ofSize: 14, weight: .semibold)
        labelBuy.textColor = Constants.Colors.primaryTeal
        labelBuy.text = "Where one can buy it?"
        return labelBuy
    }()
    private let buyTextField: UITextField = {
        let buyTextField =  UITextField()
                    buyTextField.placeholder = "Invite to visit shop or website"
                    buyTextField.font = UIFont(name:"Avenir Next", size: 14)
                    buyTextField.borderStyle = UITextField.BorderStyle.roundedRect
                    buyTextField.autocorrectionType = UITextAutocorrectionType.no
                    buyTextField.keyboardType = UIKeyboardType.default
                    buyTextField.returnKeyType = UIReturnKeyType.done
                    buyTextField.clearButtonMode = UITextField.ViewMode.whileEditing
                    buyTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                    buyTextField.autocapitalizationType = .none
                    buyTextField.textColor = Constants.Colors.primaryTeal
        return buyTextField
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
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView(frame: CGRect(x: 160, y: 300, width: 80, height: 80))
        imageView.image = Constants.Image.yoda
       return imageView
   }()
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Avenir Next", size: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = ""
        return label
    }()
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 120, y: 550, width: 150, height: 150))
        button.setTitle("Compile", for: .normal)
        button.backgroundColor = Constants.Colors.primaryTeal
        button.layer.cornerRadius = button.frame.width / 2
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name:"Avenir Next", size: 25)
        return button
    }()
    override func viewDidLoad() {
         super.viewDidLoad()
        title = "Create your ad"
        view.backgroundColor = .white
        view.addSubview(labelBrand)
        view.addSubview(brandTextField)
        view.addSubview(sloganTextField)
        view.addSubview(labelSlogan)
        view.addSubview(button)
        view.addSubview(labelBuy)
        view.addSubview(buyTextField)
        view.addSubview(stackView)
        setupConstraints()
        button.addTarget(self,
                         action: #selector(didTapCompileButton),
                        for: .touchUpInside)
        stackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeView)))
    }
    @objc func didTapCompileButton() {
        defaults.set(brandTextField.text, forKey: "brand")
        defaults.set(sloganTextField.text, forKey: "slogan")
        defaults.set(buyTextField.text, forKey: "buy")
        animate(button, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
        if brandTextField.text == "" {
            label.text = "Error. Brand field is empty."
            label.textColor = .red
        } else if sloganTextField.text == "" {
            label.text = "Error. Slogan field is empty."
            label.textColor = .red
        } else if buyTextField.text == "" {
            label.text = "Error. Please indicate where one can buy your production or book your service."
            label.textColor = .red
        } else {
            label.text = "Your Data has been successfully saved."
            label.textColor = Constants.Colors.primaryTeal
            stackView.addSubview(imageView)
        }
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
        guard let self = self else { return }
                    self.stackView.alpha = 1
        })
    }
    @objc func closeView() {
        animate(button, transform: .identity)
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
        guard let self = self else { return }
                    self.stackView.alpha = 0
        })
    }
    private func animate(_ button: UIButton, transform: CGAffineTransform) {
            UIView.animate(withDuration: 0.4,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 3,
                           options: [.curveEaseInOut],
                           animations: {
                            button.transform = transform
                }, completion: nil)
        }
    private func setupConstraints () {
        labelBrand.snp.makeConstraints{ make in
            make.height.equalTo(50)
            make.width.equalTo(250)
            make.leading.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(200)
        }
         brandTextField.snp.makeConstraints{ make in
             make.height.equalTo(40)
             make.width.equalTo(300)
             make.leading.equalToSuperview().offset(50)
             make.top.equalToSuperview().offset(250)
           }
         labelSlogan.snp.makeConstraints{ make in
             make.height.equalTo(50)
             make.width.equalTo(250)
             make.leading.equalToSuperview().offset(50)
             make.top.equalToSuperview().offset(310)
           }
         sloganTextField.snp.makeConstraints{ make in
             make.height.equalTo(40)
             make.width.equalTo(300)
             make.leading.equalToSuperview().offset(50)
             make.top.equalToSuperview().offset(350)
           }
        labelBuy.snp.makeConstraints{ make in
            make.height.equalTo(50)
            make.width.equalTo(250)
            make.leading.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(410)
          }
        buyTextField.snp.makeConstraints{ make in
            make.height.equalTo(40)
            make.width.equalTo(300)
            make.leading.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(450)
          }
        stackView.snp.makeConstraints{ make in
            make.width.equalTo(400)
            make.height.equalTo(900)
          }
        label.snp.makeConstraints{ make in
            make.width.equalTo(320)
            make.leading.equalToSuperview().offset(40)
            make.top.equalToSuperview().offset(400)
          }
}
}
