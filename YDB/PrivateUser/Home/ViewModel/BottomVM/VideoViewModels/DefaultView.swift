//
//  DefaultView.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 11.06.2022.
//

import SwiftUI

struct DefaultViewModel: View {
    @ObservedObject var userSetting = UserSettings()
    var body: some View {
        HStack(spacing: 35) {
            let formattedPets = userSetting.userPets.map{String(describing:$0)}.joined(separator: ", ")
            let formattedTravel = userSetting.userTravel.map{String(describing:$0)}.joined(separator: ", ")
            let formattedHobby = userSetting.userHobby.map{String(describing:$0)}.joined(separator: ", ")
            let formattedFood = userSetting.userFood.map{String(describing:$0)}.joined(separator: ", ")
            let formattedNeeds = userSetting.userNeeds.map{String(describing:$0)}.joined(separator: ", ")
            ButtonYoDa()
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
                ButtonFashion() }
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
                ButtonMakeUp() }
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
                ButtonGarden() }
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
                ButtonMedia() }
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
                ButtonMedicine() }
            TravelViewModel()
            FoodViewModel()
            PetsViewModel()
            ITViewModel()
            }
        }
    }

