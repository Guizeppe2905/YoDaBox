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
        let labelDescription = UILabel()
        labelDescription.font = .systemFont(ofSize: 14, weight: .semibold)
        labelDescription.textColor = Constants.Colors.primaryTeal
        labelDescription.textAlignment = .center
        labelDescription.numberOfLines = 0
        labelDescription.text = "Submit Profile & Create Ad pages in Menu, then check if Your Data is correct here"
        return labelDescription
    }()
    private let labelCompany: UILabel = {
        let labelCompany = UILabel()
        labelCompany.font = .systemFont(ofSize: 14, weight: .semibold)
        labelCompany.textColor = Constants.Colors.primaryTeal
        labelCompany.text = "Your Company Name - "
        return labelCompany
    }()
    private let labelSavedCompanyName: UILabel = {
        let labelSavedCompanyName = UILabel()
        labelSavedCompanyName.numberOfLines = 0
        labelSavedCompanyName.font = .systemFont(ofSize: 14, weight: .semibold)
        labelSavedCompanyName.textColor = Constants.Colors.primaryTeal
        return labelSavedCompanyName
    }()
    private let labelInfoIndustry: UILabel = {
        let labelInfoIndustry = UILabel()
        labelInfoIndustry.font = .systemFont(ofSize: 14, weight: .semibold)
        labelInfoIndustry.textColor = Constants.Colors.primaryTeal
        labelInfoIndustry.text = "Industry - "
        return labelInfoIndustry
    }()
    private let labelSavedIndustry: UILabel = {
        let labelSavedIndustry = UILabel()
        labelSavedIndustry.numberOfLines = 0
        labelSavedIndustry.font = .systemFont(ofSize: 14, weight: .semibold)
        labelSavedIndustry.textColor = Constants.Colors.primaryTeal
        return labelSavedIndustry
    }()
    private let labelWeb: UILabel = {
        let labelWeb = UILabel()
        labelWeb.font = .systemFont(ofSize: 14, weight: .semibold)
        labelWeb.textColor = Constants.Colors.primaryTeal
        labelWeb.text = "Website - "
        return labelWeb
    }()
    private let labelSavedWeb: UILabel = {
        let labelSavedWeb = UILabel()
        labelSavedWeb.numberOfLines = 0
        labelSavedWeb.font = .systemFont(ofSize: 14, weight: .semibold)
        labelSavedWeb.textColor = Constants.Colors.primaryTeal
        return labelSavedWeb
    }()
    private let labelBrand: UILabel = {
        let labelBrand = UILabel()
        labelBrand.font = .systemFont(ofSize: 14, weight: .semibold)
        labelBrand.textColor = Constants.Colors.primaryTeal
        labelBrand.text = "Brand Name - "
        return labelBrand
    }()
    private let labelSavedBrand: UILabel = {
        let labelSavedBrand = UILabel()
        labelSavedBrand.numberOfLines = 0
        labelSavedBrand.font = .systemFont(ofSize: 14, weight: .semibold)
        labelSavedBrand.textColor = Constants.Colors.primaryTeal
        return labelSavedBrand
    }()
    private let labelSlogan: UILabel = {
        let labelSlogan = UILabel()
        labelSlogan.font = .systemFont(ofSize: 14, weight: .semibold)
        labelSlogan.textColor = Constants.Colors.primaryTeal
        labelSlogan.text = "Slogan - "
        return labelSlogan
    }()
    private let labelSavedSlogan: UILabel = {
        let labelSavedSlogan = UILabel()
        labelSavedSlogan.numberOfLines = 0
        labelSavedSlogan.font = .systemFont(ofSize: 14, weight: .semibold)
        labelSavedSlogan.textColor = Constants.Colors.primaryTeal
        return labelSavedSlogan
    }()
    private let labelBuy: UILabel = {
        let labelBuy = UILabel()
        labelBuy.font = .systemFont(ofSize: 14, weight: .semibold)
        labelBuy.textColor = Constants.Colors.primaryTeal
        labelBuy.text = "Where one can buy it?"
        return labelBuy
    }()
    private let labelSavedBuy: UILabel = {
        let labelSavedBuy = UILabel()
        labelSavedBuy.numberOfLines = 0
        labelSavedBuy.font = .systemFont(ofSize: 14, weight: .semibold)
        labelSavedBuy.textColor = Constants.Colors.primaryTeal
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

