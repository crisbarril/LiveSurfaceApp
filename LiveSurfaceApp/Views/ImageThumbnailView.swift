//
//  ImageThumbnailView.swift
//  LiveSurfaceApp
//
//  Created by Cris beta on 21/09/2019.
//  Copyright © 2019 Cristian Barril. All rights reserved.
//

import SwiftUI

struct ImageThumbnailView: View {
    @Binding var scaleFactor: CGFloat
    @ObservedObject var viewModel: ImageThumbnailViewModel
    
    var body: some View {
        
        HStack {
            
            ZStack {
                Image(uiImage: viewModel.image ?? UIImage())
                    .resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 1.0))
                    .frame(width: 70.0, height: 70.0)
                    .zIndex(0)
            }
            
            VStack {
                Text("Name: \(viewModel.imageData.name)")
                Text("FileName: \(viewModel.imageData.filename)")
            }
            
            NavigationLink(destination: ImageDetailView(image: viewModel.imageData)) {
                Text("Edit")
            }
        }
        .padding(.all)
    }
}

//struct ImageThumbnailView_Previews: PreviewProvider {
//    @State static var mockScaleFactor: CGFloat = 1.0
//    
//    static let mockTagsData = ImageData.Tags.init(sizeDescription: "", sizeScale: "", sizeWidth: "", sizeWidthArc: "", sizeHeight: "", sizeHeightArc: "", sizeDepth: "", sizeDepthArc: "", sizeUnits: "")
//    
//    static let mockImageData = ImageData(id: 0, name: "Mock Name", number: "1", filename: "MockFileName", category: "Mock", version: "1.0", data: nil, tags: mockTagsData)
//
//    
//    static var previews: some View {
//        ImageThumbnailView(scaleFactor: $mockScaleFactor, image: mockImageData)
//    }
//}
