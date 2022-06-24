//
//  UserSettings.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 31.05.2022.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var username: String{
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }
        @Published var userLastname: String{
            didSet {
        UserDefaults.standard.set(userLastname, forKey: "userLastname")
    }
        }
    @Published var userCity: String{
        didSet {
    UserDefaults.standard.set(userCity, forKey: "userCity")
}
    }
    @Published var userEmail: String{
        didSet {
    UserDefaults.standard.set(userEmail, forKey: "userEmail")
}
    }
    @Published var userPassword: String{
        didSet {
    UserDefaults.standard.set(userPassword, forKey: "userPassword")
}
    }
    @Published var isPushed: Bool {
        didSet {
            UserDefaults.standard.set(isPushed, forKey: "isPushed")
        }
    }
    @Published var userCountry: String {
        didSet {
            UserDefaults.standard.set(userCountry, forKey: "userCountry")
        }
    }
    @Published var userBirthday: Date {
        didSet {
            UserDefaults.standard.set(userBirthday.timeIntervalSince1970, forKey: "userBirthday")
        }
    }
    @Published var userOccupation: [String] {
        didSet {
    UserDefaults.standard.set(userOccupation, forKey: "userOccupation")
}
    }
    @Published var userPets: [String] {
        didSet {
    UserDefaults.standard.set(userPets, forKey: "userPets")
}
    }
    @Published var userTravel: [String] {
        didSet {
    UserDefaults.standard.set(userTravel, forKey: "userTravel")
}
    }
    @Published var userHobby: [String] {
        didSet {
    UserDefaults.standard.set(userHobby, forKey: "userHobby")
}
    }
    @Published var userFood: [String] {
        didSet {
    UserDefaults.standard.set(userFood, forKey: "userFood")
}
    }
    @Published var userNeeds: [String] {
        didSet {
    UserDefaults.standard.set(userNeeds, forKey: "userNeeds")
}
    }
    @Published var isWatched: Bool {
        didSet {
            UserDefaults.standard.set(isWatched, forKey: "isWatched")
        }
    }
    @Published var amountEarned: Double {
        didSet {
            UserDefaults.standard.set(amountEarned, forKey: "amountEarned")
        }
    }
    @Published var numberOfVideos: Int {
        didSet {
            UserDefaults.standard.set(numberOfVideos, forKey: "numberOfVideos")
        }
    }
    public var countries = Locale.isoRegionCodes
    var formattedBirthday: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: userBirthday)
    }
    init() {
        self.username = UserDefaults.standard.object(forKey: "username") as? String ?? ""
        self.userLastname = UserDefaults.standard.object(forKey: "userLastname") as? String ?? ""
        self.userCity = UserDefaults.standard.object(forKey: "userCity") as? String ?? ""
        self.userEmail = UserDefaults.standard.object(forKey: "userEmail") as? String ?? ""
        self.userPassword = UserDefaults.standard.object(forKey: "userPassword") as? String ?? ""
        self.isPushed = UserDefaults.standard.object(forKey: "isPushed") as? Bool ?? true
        self.userCountry = UserDefaults.standard.object(forKey: "userCountry") as? String ?? "Countries"
        self.userBirthday = Date(timeIntervalSince1970: UserDefaults.standard.double(forKey: "userBirthday"))
        self.userOccupation = UserDefaults.standard.object(forKey: "userOccupation") as? [String] ?? []
        self.userPets = UserDefaults.standard.object(forKey: "userPets") as? [String] ?? []
        self.userTravel = UserDefaults.standard.object(forKey: "userTravel") as? [String] ?? []
        self.userHobby = UserDefaults.standard.object(forKey: "userHobby") as? [String] ?? []
        self.userFood = UserDefaults.standard.object(forKey: "userFood") as? [String] ?? []
        self.userNeeds = UserDefaults.standard.object(forKey: "userNeeds") as? [String] ?? []
        self.isWatched = UserDefaults.standard.object(forKey: "isWatched") as? Bool ?? true
        self.amountEarned = UserDefaults.standard.object(forKey: "amountEarned") as? Double ?? 0
        self.numberOfVideos = UserDefaults.standard.object(forKey: "numberOfVideos") as? Int ?? 0
    }
}
