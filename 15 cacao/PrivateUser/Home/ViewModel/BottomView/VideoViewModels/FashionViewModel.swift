//
//  FashionViewModel.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 13.06.2022.
//

import SwiftUI

struct FashionViewModel: View {
    @ObservedObject var userSetting = UserSettings()
    var body: some View {
        HStack(spacing: 35) {
            let formattedPets = userSetting.userPets.map{String(describing:$0)}.joined(separator: ", ")
            let formattedTravel = userSetting.userTravel.map{String(describing:$0)}.joined(separator: ", ")
            let formattedHobby = userSetting.userHobby.map{String(describing:$0)}.joined(separator: ", ")
            let formattedFood = userSetting.userFood.map{String(describing:$0)}.joined(separator: ", ")
            let formattedNeeds = userSetting.userNeeds.map{String(describing:$0)}.joined(separator: ", ")
            ButtonFashion()
            if formattedTravel.contains("Beach") {
                ButtonTravel()
            } else if formattedTravel.contains("Mountains") {
                ButtonMountains()
            } else if formattedTravel.contains("Excursions") {
                ButtonExcursion()
            } else if formattedTravel.contains("Extreme") {
                ButtonExtreme()
            } else if formattedTravel.contains("Sport-tours") {
                ButtonSportTour()
            } else if formattedTravel.contains("Diving") {
                ButtonDiving()
            } else {
                ButtonMakeUp() }
            if formattedPets.contains("Cat") {
                ButtonCat()
            } else if formattedPets.contains("Dog") {
                ButtonDog()
            } else if formattedPets.contains("Fishes") {
                ButtonFishes()
            } else if formattedPets.contains("Birds") {
                ButtonParrot()
            } else if formattedPets.contains("Turtle") {
                ButtonTurtle()
            } else if formattedPets.contains("Rodants") {
                ButtonRodent()
            } else {
                ButtonCosmetics() }
            if formattedFood.contains("Vegetarian") {
                ButtonHealthyFood()
            } else if formattedFood.contains("Seafood") {
                ButtonSeafood()
            } else if formattedFood.contains("Burgers") {
                ButtonBurger()
            } else if formattedFood.contains("Grill") {
                ButtonGrill()
            } else if formattedFood.contains("Sushi") {
                ButtonSushi()
            } else if formattedFood.contains("Italian") {
                ButtonItalian()
            } else if formattedFood.contains("Oriental") {
                ButtonOriental()
            } else if formattedFood.contains("Mexican") {
                ButtonMexican()
            } else {
                ButtonHands() }
            if formattedHobby.contains("Diving") {
                ButtonDiving()
            } else if formattedHobby.contains("Gardening") {
                ButtonGarden()
            } else if formattedHobby.contains("Games") {
                ButtonGames()
            } else if formattedHobby.contains("Cooking") {
                ButtonHealthyFood()
            } else if formattedHobby.contains("Sport") {
                ButtonFitness()
            } else if formattedHobby.contains("Shopping") {
                ButtonFashion()
            } else if formattedHobby.contains("Fishing") {
                ButtonFishing()
            } else if formattedHobby.contains("Movies") {
                ButtonMovie()
            } else {
                ButtonCosmetology() }
            if formattedNeeds.contains("Household") {
                ButtonGarden()
            } else if formattedNeeds.contains("Home design") {
                ButtonHomeDesign()
            } else if formattedNeeds.contains("Healthcare") {
                ButtonMedicine()
            } else if formattedNeeds.contains("Trainings") {
                ButtonIT()
            } else if formattedNeeds.contains("Sports fan") {
                ButtonSportTour()
            } else if formattedNeeds.contains("Spa") {
                ButtonSpa()
            } else {
                ButtonSpa() }
            ButtonFitness()
            ButtonHealthyFood()
            ButtonTravel()
            ButtonYoDa()
        }
    }
}
