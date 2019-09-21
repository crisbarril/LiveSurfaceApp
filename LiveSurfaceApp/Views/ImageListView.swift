//
//  ContentView.swift
//  LiveSurfaceApp
//
//  Created by Cristian Barril on 20/09/2019.
//  Copyright © 2019 Cristian Barril. All rights reserved.
//

import SwiftUI

struct ImageListView: View {
    
    @State private var scaleFactor: CGFloat = 1.0
    @ObservedObject var viewModel: ImagesListViewModel
    @EnvironmentObject var editedImages: EditedImage
    
    var body: some View {
        NavigationView {
            
            VStack {
                ScrollView {
                    Text("Downloaded images")
                        .font(.title)
                    ForEach(viewModel.images) { image in
                        ImageThumbnailView(scaleFactor: self.$scaleFactor, viewModel: .init(imageData: image))
                            .background(Color.red.opacity(0.5))
                            .cornerRadius(10.0)
                            .padding()
                    }
                    
                    if editedImages.images.count > 0 {
                        Text("Edited images")
                            .font(.title)
                        ForEach(editedImages.images) { image in
                            ImageThumbnailView(scaleFactor: self.$scaleFactor, viewModel: .init(imageData: image))
                                .background(Color.red.opacity(0.5))
                                .cornerRadius(10.0)
                                .padding()
                        }
                    }
                }
                .scaleEffect(self.scaleFactor)
                
                Slider(value: $scaleFactor, in: 0.75...1.25, step: 0.05)
                    .padding()
            }
            
            
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
            .alert(isPresented: $viewModel.isErrorShown, content: { () -> Alert in
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
            })
            .onAppear { self.viewModel.onAppear() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageListView(viewModel: .init())
    }
}
