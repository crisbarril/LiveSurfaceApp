//
//  ImageThumbnailView.swift
//  LiveSurfaceApp
//
//  Created by Cristian Barril on 21/09/2019.
//  Copyright © 2019 Cristian Barril. All rights reserved.
//

import SwiftUI

struct ImageThumbnailView: View {
    @Binding var scaleFactor: CGFloat
    @ObservedObject var viewModel: ImageThumbnailViewModel
    
    var body: some View {
        
        HStack {
            
            Image(uiImage: viewModel.image ?? UIImage())
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 1.0))
                .frame(width: 70.0, height: 70.0)
            
            VStack {
                Text("Name: \(viewModel.imageData.name)")
                Text("FileName: \(viewModel.imageData.filename)")
            }
            .font(.subheadline)
            .foregroundColor(Color.white)
            .frame(minWidth: 130)
            
            Spacer()
            
            if (viewModel.image != nil) {
                NavigationLink(destination: ImageDetailView(viewModel: .init(image: viewModel.image!, imageData: viewModel.imageData))) {
                    Text("Edit")
                }
            }
        }
        .padding(.all)
    }
}
