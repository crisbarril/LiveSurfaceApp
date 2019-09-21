//
//  ImagesRequest.swift
//  LiveSurfaceApp
//
//  Created by Cristian Barril on 21/09/2019.
//  Copyright © 2019 Cristian Barril. All rights reserved.
//

import Foundation

struct ImagesRequest: RequestProtocol {
    typealias Response = ImagesResponse
    
    var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = LiveSurfaceAPI.scheme
        components.host = LiveSurfaceAPI.host
        components.path = LiveSurfaceAPI.path + "/api/images.php"
        
        components.queryItems = [
          URLQueryItem(name: "key", value: LiveSurfaceAPI.key)
        ]
        
        return components
    }
}
