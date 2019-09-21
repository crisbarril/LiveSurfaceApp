//
//  NetworkProtocol.swift
//  LiveSurfaceApp
//
//  Created by Cristian Barril on 21/09/2019.
//  Copyright © 2019 Cristian Barril. All rights reserved.
//

import Foundation
import Combine

protocol NetworkProtocol {
    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, NetworkError> where Request: RequestProtocol
}
