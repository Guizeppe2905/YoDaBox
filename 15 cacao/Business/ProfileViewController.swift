//
//  ProfileVC.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 31.05.2022.
//

import UIKit
import SwiftUI

class ProfileViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let defaults = UserDefaults.standard
    private let labelCompany: UILabel = {
        let labelCompany = CustomLabel()
        labelCompany.text = "Your company name"
        return labelCompany
    }()
    private let companyTextField: UITextField = {
        let companyTextField = CustomTextField()
        companyTextField.placeholder = "Company"
        return companyTextField
    }()
    private let labelIndustry: UILabel = {
        let labelIndustry = CustomLabel()
        labelIndustry.text = "Industry -"
        return labelIndustry
    }()
    private let labelWeb: UILabel = {
        let labelWeb = CustomLabel()
        labelWeb.text = "Website"
        return labelWeb
    }()
   private let webTextField: UITextField = {
        let webTextField =  CustomTextField()
        webTextField.placeholder = "https://...."
        webTextField.autocapitalizationType = .none
        return webTextField
    }()
    private var industryArray = ["IT", "Medicine", "Science", "Food", "Sport", "Construction", "Travel", "Media", "Beauty", "Cars", "Pets", "Diving", "Movies", "Games", "Fashion", "Gardening", "Repair", "Home Design", "Flowers", "Fishing"]
    let picker = UIPickerView()
    private let labelIndustry1: UILabel = {
        let labelIndustry1 = CustomLabel()
        return labelIndustry1
    }()
    private let button: UIButton = {
        let button = CustomButton(frame: CGRect(x: 130, y: 600, width: 150, height: 150))
        button.setTitle("Submit", for: .normal)
        button.titleLabel?.font = UIFont(name:"Avenir Next", size: 25)
        return button
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
        let label = CustomLabel()
        label.textAlignment = .center
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .white
        view.addSubview(labelCompany)
        view.addSubview(companyTextField)
        view.addSubview(labelIndustry)
        view.addSubview(picker)
        view.addSubview(labelWeb)
        view.addSubview(webTextField)
        view.addSubview(labelIndustry1)
        view.addSubview(button)
        view.addSubview(stackView)
        setupConstraints()
        self.picker.dataSource = self
        self.picker.delegate = self
        button.addTarget(self,
                         action: #selector(didTapSubmitButton),
                        for: .touchUpInside)
        stackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeView)))
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return industryArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return industryArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.labelIndustry1.text = industryArray[row]
    }
    @objc func didTapSubmitButton() {
        defaults.set(companyTextField.text, forKey: "companyName")
        defaults.set(webTextField.text, forKey: "website")
        defaults.set(labelIndustry1.text, forKey: "industry")
        animate(button, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
        if companyTextField.text == "" {
            label.text = "Error. Company name field is empty."
            label.textColor = .red
        } else if webTextField.text == "" {
            label.text = "Error. Website field is empty."
            label.textColor = .red
        } else if labelIndustry1.text == "" {
            label.text = "Error. Industry is not selected."
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
        labelCompany.snp.makeConstraints{ make in
            make.height.equalTo(50)
            make.width.equalTo(250)
            make.leading.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(150)
        }
         companyTextField.snp.makeConstraints{ make in
             make.height.equalTo(40)
             make.width.equalTo(300)
             make.leading.equalToSuperview().offset(50)
             make.top.equalToSuperview().offset(200)
           }
         labelIndustry.snp.makeConstraints{ make in
             make.height.equalTo(40)
             make.width.equalTo(80)
             make.leading.equalToSuperview().offset(50)
             make.top.equalToSuperview().offset(250)
           }
         labelIndustry1.snp.makeConstraints{ make in
             make.height.equalTo(40)
             make.width.equalTo(200)
             make.leading.equalToSuperview().offset(180)
             make.top.equalToSuperview().offset(250)
           }
        picker.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(40)
            make.top.equalToSuperview().offset(270)
          }
        labelWeb.snp.makeConstraints{ make in
            make.height.equalTo(50)
            make.width.equalTo(250)
            make.leading.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(480)
        }
        webTextField.snp.makeConstraints{ make in
            make.height.equalTo(40)
            make.width.equalTo(300)
            make.leading.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(520)
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


