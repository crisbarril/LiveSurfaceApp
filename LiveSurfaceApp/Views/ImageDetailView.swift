//
//  ImageDetailView.swift
//  LiveSurfaceApp
//
//  Created by Cristian Barril on 21/09/2019.
//  Copyright © 2019 Cristian Barril. All rights reserved.
//

import SwiftUI

struct ImageDetailView: View {
    var image: ImageData

    var body: some View {
        Text(image.filename)
    }
}

struct ImageDetailView_Previews: PreviewProvider {
    
    static let mockTagsData = ImageData.Tags.init(sizeDescription: "", sizeScale: "", sizeWidth: "", sizeWidthArc: "", sizeHeight: "", sizeHeightArc: "", sizeDepth: "", sizeDepthArc: "", sizeUnits: "")
    
    static let mockImageData = ImageData(id: 0, name: "Mock Name", number: "1", filename: "MockFileName", category: "Mock", version: "1.0", data: nil, tags: mockTagsData)

    static var previews: some View {
        ImageDetailView(image: mockImageData)
    }
}
