//
//  PhotoPicker.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 25.05.2022.
//

import SwiftUI

struct PhotoPicker: View {
    @State var showImagePicker: Bool = false
    @State var image: Image? = nil
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    self.showImagePicker.toggle()
                }) {
                    Text("Choose avatar")
                }
                if image == nil {
                    Image(uiImage: Constants.Image.ava!)
                        .resizable().frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle().stroke(Color(Constants.Colors.primaryTeal!), lineWidth: 5))
                } else {
                    image?.resizable().frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle().stroke(Color(Constants.Colors.primaryTeal!), lineWidth: 5))
                }
            } .sheet(isPresented: $showImagePicker) {
                ImagePicker(sourceType: .photoLibrary) { image in
                    self.image = Image(uiImage: image)
                }
            }
        } 
    }
}

