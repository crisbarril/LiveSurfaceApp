//
//  ImagesResponse.swift
//  LiveSurfaceApp
//
//  Created by Cristian Barril on 21/09/2019.
//  Copyright © 2019 Cristian Barril. All rights reserved.
//

import Foundation

struct ImagesResponse: Codable {
    let images: [String: ImageData]
}
