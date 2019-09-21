//
//  NetworkService.swift
//  LiveSurfaceApp
//
//  Created by Cristian Barril on 21/09/2019.
//  Copyright © 2019 Cristian Barril. All rights reserved.
//

import Foundation
import Combine

enum LiveSurfaceAPI {
    static let scheme = "https"
    static let host = "www.livesurface.com"
    static let path = "/test"
    static let key = "52b855a8-f8f5-494e-bd4f-1aed5b2be1ce"
}

final class NetworkService: NetworkProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, NetworkError> where Request: RequestProtocol {
        
        guard let url = request.urlComponents.url else {
            let error = NetworkError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: URLRequest(url: url))
            .map { data, urlResponse in data }
            .mapError { error in
                NetworkError.network(description: error.localizedDescription)                
            }
            .decode(type: Request.Response.self, decoder: JSONDecoder())
            .mapError { error in
                NetworkError.parsing(description: error.localizedDescription)
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
