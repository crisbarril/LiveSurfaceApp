//
//  ImageDetailViewModel.swift
//  LiveSurfaceApp
//
//  Created by Cristian Barril on 21/09/2019.
//  Copyright © 2019 Cristian Barril. All rights reserved.
//

import SwiftUI
import Combine
import CoreImage

final class ImageDetailViewModel: ObservableObject {
    
    @Published private(set) var image: UIImage    
    
    let imageData: ImageData
    
    init(image: UIImage, imageData: ImageData) {
        self.imageData = imageData
        self.image = image
    }
    
    func edit() {
            let filter = CIFilter(name: "CIPhotoEffectChrome")
            // convert UIImage to CIImage and set as input
            let ciInput = CIImage(image: image)
            filter?.setValue(ciInput, forKey: "inputImage")
            // get output CIImage, render as CGImage first to retain proper UIImage scale
            let ciOutput = filter?.outputImage
            let ciContext = CIContext()
            let cgImage = ciContext.createCGImage(ciOutput!, from: (ciOutput?.extent)!)
            
            self.image = UIImage(cgImage: cgImage!)
    }

    func saveImage() -> ImageData {
        return ImageData(id: Int(NSTimeIntervalSince1970), name: "Edited \(imageData.name)", number: imageData.number, filename: imageData.filename, category: imageData.category, version: imageData.version, data: image.pngData(), tags: imageData.tags)
    }
}
