//
//  ImageDataRequest.swift
//  LiveSurfaceApp
//
//  Created by Cris beta on 21/09/2019.
//  Copyright © 2019 Cristian Barril. All rights reserved.
//

import Foundation

struct ImageDataRequest: RequestProtocol {
    typealias Response = ImageDataResponse
    
    var imageName: String
    var contentType: String = "image/jpeg"
    var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = LiveSurfaceAPI.scheme
        components.host = LiveSurfaceAPI.host
        components.path = LiveSurfaceAPI.path + "/images/\(imageName)"
        
        return components
    }
}
