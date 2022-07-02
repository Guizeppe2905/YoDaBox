//
//  MenuViewController.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 28.05.2022.
//

import UIKit
import SnapKit

protocol MenuViewControllerDelegate: AnyObject {
    func didSelect(menuItem: MenuViewController.MenuOption)
}
class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    weak var delegate: MenuViewControllerDelegate?
    enum MenuOption: String, CaseIterable {
        case home = "Home"
        case profile = "Profile"
        case ad = "Create ad"
        case info = "Info"
        case settings = "Watch your ad"
        var imageName: String {
            switch self {
            case .home:
                return "house"
            case .profile:
                return "person"
            case .ad:
                return "airplane"
            case .info:
                return "message"
            case .settings:
                return "gear"
            }
        }
    }
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.backgroundColor = Constants.Colors.primaryTeal
        return tableView
    }()
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView(frame: CGRect(x: 5, y: 180, width: 80, height: 80))
        imageView.image = Constants.Image.yoda
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 1
        let myColor = UIColor.white
        imageView.layer.borderColor = myColor.cgColor
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
       return imageView
   }()
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.primaryTeal
        label.font = UIFont(name:"Avenir Next", size: 20)
        label.text = "YoDa Box Business Manager"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addSubview(tableView)
        stackView.layer.masksToBounds = false
        stackView.layer.cornerRadius = 50
        stackView.clipsToBounds = true
        stackView.backgroundColor = Constants.Colors.primaryTeal
        return stackView
    }()
    private lazy var stackView1: UIStackView = {
        let stackView1 = UIStackView()
        stackView1.addSubview(imageView)
        stackView1.addSubview(label)
        stackView1.layer.masksToBounds = false
        stackView1.layer.cornerRadius = 80
        stackView1.layer.maskedCorners =  [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner]
        stackView1.clipsToBounds = true
        stackView1.backgroundColor = Constants.Colors.teal1
        return stackView1
    }()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: view.bounds.size.height)
    }
    override func viewDidLoad() {
         super.viewDidLoad()
        view.addSubview(stackView)
        view.addSubview(stackView1)
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        setupConstraints()
    }
    private func setupConstraints () {
        stackView.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-160)
            make.bottom.equalToSuperview()
          }
        stackView1.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(-50)
            make.trailing.equalToSuperview().offset(-160)
            make.bottom.equalToSuperview().offset(-550)
          }
        label.snp.makeConstraints{ make in
            make.width.equalTo(120)
            make.leading.equalToSuperview().offset(90)
            make.top.equalToSuperview().offset(180)
          }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOption.allCases.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = MenuOption.allCases[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont(name:"Avenir Next", size: 16)
        cell.backgroundColor = Constants.Colors.primaryTeal
        cell.contentView.backgroundColor = Constants.Colors.primaryTeal
        cell.imageView?.image = UIImage(systemName: MenuOption.allCases[indexPath.row].imageName)
        cell.imageView?.tintColor = .white
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = MenuOption.allCases[indexPath.row]
        delegate?.didSelect(menuItem: item)
    }
   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 120))
         return headerView
        }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 120
        }
}
