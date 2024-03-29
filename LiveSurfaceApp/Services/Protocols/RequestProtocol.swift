//
//  RequestProtocol.swift
//  LiveSurfaceApp
//
//  Created by Cristian Barril on 21/09/2019.
//  Copyright © 2019 Cristian Barril. All rights reserved.
//

import Foundation

protocol RequestProtocol {
    associatedtype Response: Decodable
    
    var urlComponents: URLComponents { get }
    var contentType: String { get }
}
