//
//  ImageThumbnailViewModel.swift
//  LiveSurfaceApp
//
//  Created by Cris beta on 21/09/2019.
//  Copyright © 2019 Cristian Barril. All rights reserved.
//

import SwiftUI
import Combine

final class ImageThumbnailViewModel: ObservableObject {
    
    @Published private(set) var image: UIImage? = nil
    @Published var isErrorShown = false
    @Published var errorMessage = ""
    
    let imageData: ImageData
    
    private let networkService: NetworkProtocol
    private var disposables = Set<AnyCancellable>()
    private let errorSubject = PassthroughSubject<NetworkError, Never>()
    
    init(networkService: NetworkProtocol = NetworkService(), imageData: ImageData) {
        self.networkService = networkService
        self.imageData = imageData
        requestData()
    }
    
    private func requestData() {
         
        networkService.getImage(from: ImageDataRequest(imageName: imageData.filename))
            .catch { [weak self] error -> Empty<Data, Never> in
                self?.errorSubject.send(error)
                return .init()
            }            
        .receive(on: RunLoop.main)
        .map { UIImage(data: $0) }
        .assign(to: \.image, on: self)
        .store(in: &disposables)

        errorSubject
            .map { $0.localizedDescription }
            .assign(to: \.errorMessage, on: self)
            .store(in: &disposables)

        errorSubject
            .map { _ in true }
            .assign(to: \.isErrorShown, on: self)
            .store(in: &disposables)
    }
}
