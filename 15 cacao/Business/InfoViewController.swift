//
//  InfoViewController.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 31.05.2022.
//

import UIKit
import SwiftUI

class InfoViewController: UIViewController {
    
    private let labelDescription: UILabel = {
        let labelDescription = CustomLabel()
        labelDescription.textAlignment = .center
        labelDescription.text = "Submit Profile & Create Ad pages in Menu, then check if Your Data is correct here"
        return labelDescription
    }()
    private let labelCompany: UILabel = {
        let labelCompany = CustomLabel()
        labelCompany.text = "Your Company Name - "
        return labelCompany
    }()
    private let labelSavedCompanyName: UILabel = {
        let labelSavedCompanyName = CustomLabel()
        return labelSavedCompanyName
    }()
    private let labelInfoIndustry: UILabel = {
        let labelInfoIndustry = CustomLabel()
        labelInfoIndustry.text = "Industry - "
        return labelInfoIndustry
    }()
    private let labelSavedIndustry: UILabel = {
        let labelSavedIndustry = CustomLabel()
        return labelSavedIndustry
    }()
    private let labelWeb: UILabel = {
        let labelWeb = CustomLabel()
        labelWeb.text = "Website - "
        return labelWeb
    }()
    private let labelSavedWeb: UILabel = {
        let labelSavedWeb = CustomLabel()
        return labelSavedWeb
    }()
    private let labelBrand: UILabel = {
        let labelBrand = CustomLabel()
        labelBrand.text = "Brand Name - "
        return labelBrand
    }()
    private let labelSavedBrand: UILabel = {
        let labelSavedBrand = CustomLabel()
        return labelSavedBrand
    }()
    private let labelSlogan: UILabel = {
        let labelSlogan = CustomLabel()
        labelSlogan.text = "Slogan - "
        return labelSlogan
    }()
    private let labelSavedSlogan: UILabel = {
        let labelSavedSlogan = CustomLabel()
        return labelSavedSlogan
    }()
    private let labelBuy: UILabel = {
        let labelBuy = CustomLabel()
        labelBuy.text = "Where one can buy it?"
        return labelBuy
    }()
    private let labelSavedBuy: UILabel = {
        let labelSavedBuy = CustomLabel()
        return labelSavedBuy
    }()
    override func viewDidLoad() {
         super.viewDidLoad()
        title = "Info"
        view.backgroundColor = .white
        view.addSubview(labelDescription)
        view.addSubview(labelCompany)
        view.addSubview(labelSavedCompanyName)
        view.addSubview(labelInfoIndustry)
        view.addSubview(labelSavedIndustry)
        view.addSubview(labelWeb)
        view.addSubview(labelSavedWeb)
        view.addSubview(labelBrand)
        view.addSubview(labelSavedBrand)
        view.addSubview(labelSlogan)
        view.addSubview(labelSavedSlogan)
        view.addSubview(labelBuy)
        view.addSubview(labelSavedBuy)
        setupConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        labelSavedCompanyName.text = UserDefaults.standard.string(forKey: "companyName")
        labelSavedIndustry.text = UserDefaults.standard.string(forKey: "industry")
        labelSavedWeb.text = UserDefaults.standard.string(forKey: "website")
        labelSavedBrand.text = UserDefaults.standard.string(forKey: "brand")
        labelSavedSlogan.text = UserDefaults.standard.string(forKey: "slogan")
        labelSavedBuy.text = UserDefaults.standard.string(forKey: "buy")
    }
    private func setupConstraints () {
        labelDescription.snp.makeConstraints{ make in
            make.height.equalTo(80)
            make.width.equalTo(350)
            make.leading.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(150)
            }
        labelCompany.snp.makeConstraints{ make in
            make.height.equalTo(80)
            make.width.equalTo(160)
            make.leading.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(250)
            }
        labelSavedCompanyName.snp.makeConstraints{ make in
            make.height.equalTo(80)
            make.width.equalTo(150)
            make.leading.equalToSuperview().offset(210)
            make.top.equalToSuperview().offset(250)
        }
        labelInfoIndustry.snp.makeConstraints{ make in
            make.height.equalTo(80)
            make.width.equalTo(160)
            make.leading.equalTo(labelCompany)
            make.top.equalToSuperview().offset(330)
            }
        labelSavedIndustry.snp.makeConstraints{ make in
            make.height.equalTo(80)
            make.width.equalTo(150)
            make.leading.equalTo(labelSavedCompanyName)
            make.top.equalToSuperview().offset(330)
        }
        labelWeb.snp.makeConstraints{ make in
            make.height.equalTo(80)
            make.width.equalTo(160)
            make.leading.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(410)
        }
        labelSavedWeb.snp.makeConstraints{ make in
            make.height.equalTo(80)
            make.width.equalTo(150)
            make.leading.equalToSuperview().offset(210)
            make.top.equalToSuperview().offset(410)
        }
        labelBrand.snp.makeConstraints{ make in
            make.height.equalTo(80)
            make.width.equalTo(160)
            make.leading.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(490)
        }
        labelSavedBrand.snp.makeConstraints{ make in
            make.height.equalTo(80)
            make.width.equalTo(150)
            make.leading.equalToSuperview().offset(210)
            make.top.equalToSuperview().offset(490)
        }
        labelSlogan.snp.makeConstraints{ make in
            make.height.equalTo(80)
            make.width.equalTo(160)
            make.leading.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(570)
        }
        labelSavedSlogan.snp.makeConstraints{ make in
            make.height.equalTo(80)
            make.width.equalTo(150)
            make.leading.equalToSuperview().offset(210)
            make.top.equalToSuperview().offset(570)
        }
        labelBuy.snp.makeConstraints{ make in
            make.height.equalTo(80)
            make.width.equalTo(160)
            make.leading.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(650)
        }
        labelSavedBuy.snp.makeConstraints{ make in
            make.height.equalTo(80)
            make.width.equalTo(150)
            make.leading.equalToSuperview().offset(210)
            make.top.equalToSuperview().offset(650)
        }
    }
}

