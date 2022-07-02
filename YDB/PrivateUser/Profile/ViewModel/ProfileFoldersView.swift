//
//  ProfileMenu.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 22.05.2022.
//

import SwiftUI

struct ProfileFoldersView: View {
    @State var folderChosen = false
    @State var numberOfFolder = "0"
    @State var profileFolders = [
    ProfileFolders(id: 0, image: "job2", offset: 0, title: "Occupation"),
    ProfileFolders(id: 1, image: "dolphine", offset: 0, title: "Travel"),
    ProfileFolders(id: 2, image: "dog", offset: 0, title: "Pets"),
    ProfileFolders(id: 3, image: "oranges", offset: 0, title: "Food"),
    ProfileFolders(id: 4, image: "hobby1", offset: 0, title: "Hobby"),
    ProfileFolders(id: 5, image: "tealSweets", offset: 0, title: "More info")
]
    @State var scrolled = 0
    var body: some View {
        ZStack {
            ForEach(profileFolders.reversed()) { profileFolder in
                HStack {
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                Image(profileFolder.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: calculateWidth(), height: 280, alignment: .bottom)
                    .cornerRadius(15)
                        VStack(alignment: .leading, spacing: 18) {
                            HStack {
                                Text(profileFolder.title)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            HStack {
                            Button {
                                numberOfFolder = "\(profileFolder.id)"
                                chooseFolder()
                                
                            } label: {
                                    Text("Press to choose")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 25)
                                        .background(.blue)
                                        .clipShape(Capsule())
                                    Spacer()
                            }
                            }
                        }
                        .frame(width: calculateWidth() - 40)
                        .padding(.leading, 20)
                        .padding(.bottom, 20)
                        
                    }
                    .offset(x: profileFolder.id - scrolled <= 2 ? CGFloat(profileFolder.id - scrolled) * 30 : 60)
                  Spacer(minLength: 0)
            }
                .contentShape(Rectangle())
                .offset(x: profileFolder.offset)
                .gesture(DragGesture().onChanged ({ (value) in
                        withAnimation {
                            if value.translation.width < 0 && profileFolder.id != profileFolders.last!.id {
                                profileFolders[profileFolder.id].offset = value.translation.width
                            } else {
                                if profileFolder.id > 0 {
                                    profileFolders[profileFolder.id - 1].offset = -(calculateWidth() + 60) + value.translation.width
                                }}}}) .onEnded ({ (value) in
                        withAnimation {
                        if value.translation.width  < 0 {
                            if -value.translation.width > 180 && profileFolder.id != profileFolders.last!.id {
                                profileFolders[profileFolder.id].offset = -(calculateWidth() + 60)
                                scrolled += 1
                            } else {
                                profileFolders[profileFolder.id].offset = 0
                            }} else {
                            if profileFolder.id > 0 {
                                if value.translation.width > 180 {
                                    profileFolders[profileFolder.id - 1].offset = 0
                                    scrolled -= 1
                                } else {
                                    profileFolders[profileFolder.id - 1].offset = -(calculateWidth() + 60)
                                }}}}}))
                .frame(height: UIScreen.main.bounds.height / 3.8)
                .padding(.horizontal, 25)
                .padding(.top, 25)
      Spacer(minLength: 0)
            }}}
    func calculateWidth() -> CGFloat {
        let screen = UIScreen.main.bounds.width - 50
        let width = screen - (2 * 30)
        return width
    }
    func goToOccupation() {
        let keyWindow = UIApplication.shared.connectedScenes
           .filter({$0.activationState == .foregroundActive})
           .map({$0 as? UIWindowScene})
           .compactMap({$0})
           .first?.windows
           .filter({$0.isKeyWindow}).first
       keyWindow!.rootViewController = UIHostingController(rootView: OccupationView())
       keyWindow!.makeKeyAndVisible()
    }
    func goToTravel() {
        let keyWindow = UIApplication.shared.connectedScenes
           .filter({$0.activationState == .foregroundActive})
           .map({$0 as? UIWindowScene})
           .compactMap({$0})
           .first?.windows
           .filter({$0.isKeyWindow}).first
       keyWindow!.rootViewController = UIHostingController(rootView: TravelView())
       keyWindow!.makeKeyAndVisible()
    }
    func goToPets() {
        let keyWindow = UIApplication.shared.connectedScenes
           .filter({$0.activationState == .foregroundActive})
           .map({$0 as? UIWindowScene})
           .compactMap({$0})
           .first?.windows
           .filter({$0.isKeyWindow}).first
       keyWindow!.rootViewController = UIHostingController(rootView: PetsView())
       keyWindow!.makeKeyAndVisible()
    }
    func goToFood() {
        let keyWindow = UIApplication.shared.connectedScenes
           .filter({$0.activationState == .foregroundActive})
           .map({$0 as? UIWindowScene})
           .compactMap({$0})
           .first?.windows
           .filter({$0.isKeyWindow}).first
       keyWindow!.rootViewController = UIHostingController(rootView: FoodView())
       keyWindow!.makeKeyAndVisible()
    }
    func goToHobby() {
        let keyWindow = UIApplication.shared.connectedScenes
           .filter({$0.activationState == .foregroundActive})
           .map({$0 as? UIWindowScene})
           .compactMap({$0})
           .first?.windows
           .filter({$0.isKeyWindow}).first
       keyWindow!.rootViewController = UIHostingController(rootView: HobbyView())
       keyWindow!.makeKeyAndVisible()
    }
    func goToNeeds() {
        let keyWindow = UIApplication.shared.connectedScenes
           .filter({$0.activationState == .foregroundActive})
           .map({$0 as? UIWindowScene})
           .compactMap({$0})
           .first?.windows
           .filter({$0.isKeyWindow}).first
       keyWindow!.rootViewController = UIHostingController(rootView: NeedsView())
       keyWindow!.makeKeyAndVisible()
    }    
    func chooseFolder() {
if numberOfFolder == "0" {
        goToOccupation()
} else if numberOfFolder == "1" {
    goToTravel()
} else if numberOfFolder == "2" {
    goToPets()
} else if numberOfFolder == "3" {
    goToFood()
} else if numberOfFolder == "4" {
    goToHobby()
} else {
    goToNeeds()
}
    }
}



