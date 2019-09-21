//
//  ImageDetailView.swift
//  LiveSurfaceApp
//
//  Created by Cristian Barril on 21/09/2019.
//  Copyright © 2019 Cristian Barril. All rights reserved.
//

import SwiftUI

struct ImageDetailView: View {
    
    @EnvironmentObject var editedImages: EditedImage
    @ObservedObject var viewModel: ImageDetailViewModel    
    
    var body: some View {
        VStack {
            Image(uiImage: viewModel.image)
                .resizable()
                                 
            HStack {
            
                Button(action: {
                    self.viewModel.edit()
                }) {
                    Text("Chrome Effect")
                        .foregroundColor(Color.white)
                }
                .frame(width: 150, height: 50)
                .background(Color.blue)
                .cornerRadius(5.0)
                .padding()
                
                Button(action: {
                    let newImage = self.viewModel.saveImage()
                    self.editedImages.images.append(newImage)
                }) {
                    Text("Save")
                        .foregroundColor(Color.white)
                }
                .frame(width: 100, height: 50)
                .background(Color.green)
                .cornerRadius(5.0)
                .padding()
            }
        }
        
    }
}
