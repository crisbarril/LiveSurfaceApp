//
//  ImagesListViewModel.swift
//  LiveSurfaceApp
//
//  Created by Cristian Barril on 21/09/2019.
//  Copyright © 2019 Cristian Barril. All rights reserved.
//

import Foundation
import Combine

final class ImagesListViewModel: ObservableObject {
    
    @Published private(set) var images: [ImageData] = []
    @Published var isErrorShown = false
    @Published var errorMessage = ""
    
    private let networkService: NetworkProtocol
    private var disposables = Set<AnyCancellable>()
    private let errorSubject = PassthroughSubject<NetworkError, Never>()
    
    init(networkService: NetworkProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func onAppear() {
        requestData()
    }
    
    private func requestData() {
         
        networkService.response(from: ImagesRequest())
            .catch { [weak self] error -> Empty<ImagesResponse, Never> in
                self?.errorSubject.send(error)
                return .init()
            }
        .retry(3)
        .map { $0.images.map { $0.value } }
        .assign(to: \.images, on: self)
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
