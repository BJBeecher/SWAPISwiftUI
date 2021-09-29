//
//  URLImageVM.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/25/21.
//

import Foundation
import Combine
import SwiftUI

extension URLImageView {
    final class ViewModel : ObservableObject {
        @Published private (set) var loadState = LoadState<UIImage>.idle
        
        var token : AnyCancellable?
        
        deinit {
            token?.cancel()
        }
    }
}

// api

extension URLImageView.ViewModel {
    func viewDidAppear(url: URL){
        let session = URLSession.shared
        
        token = session.dataTaskPublisher(for: url)
            .map(\.data)
            .tryMap { data in
                if let image = UIImage(data: data) {
                    return image
                } else {
                    throw DataNotImageError()
                }
            }
            .convertToLoadState()
            .sink(receiveValue: setLoadState)
    }
    
    func setLoadState(loadState: LoadState<UIImage>){
        publish {
            self.loadState = loadState
        }
    }
}

// types

extension URLImageView.ViewModel {
    struct DataNotImageError : Error {}
}
