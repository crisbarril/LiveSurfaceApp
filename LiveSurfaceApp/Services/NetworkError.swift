//
//  NetworkError.swift
//  LiveSurfaceApp
//
//  Created by Cristian Barril on 21/09/2019.
//  Copyright © 2019 Cristian Barril. All rights reserved.
//

import Foundation

enum NetworkError: Error {
  case parsing(description: String)
  case network(description: String)
}
