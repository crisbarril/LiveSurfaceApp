//
//  ImageData.swift
//  LiveSurfaceApp
//
//  Created by Cristian Barril on 21/09/2019.
//  Copyright © 2019 Cristian Barril. All rights reserved.
//

import Foundation

struct ImageData: Codable, Identifiable {
    let id: Int
    let name: String
    let number: String
    let filename: String
    let category: String
    let version: String
    let tags: Tags
    
    enum CodingKeys: String, CodingKey {
        case id = "index"
        case name
        case number
        case filename = "image"
        case category
        case version
        case tags
    }
    
    struct Tags: Codable {
        let sizeDescription: String
        let sizeScale: String
        let sizeWidth: String
        let sizeWidthArc: String
        let sizeHeight: String
        let sizeHeightArc: String
        let sizeDepth: String
        let sizeDepthArc: String
        let sizeUnits: String
        
        enum CodingKeys: String, CodingKey {
            case sizeDescription = "sizedescription"
            case sizeScale = "sizescale"
            case sizeWidth = "sizewidth"
            case sizeWidthArc = "sizewidtharc"
            case sizeHeight = "sizeheight"
            case sizeHeightArc = "sizeheightarc"
            case sizeDepth = "sizedepth"
            case sizeDepthArc = "sizedeptharc"
            case sizeUnits = "sizeunits"
        }
    }
}
