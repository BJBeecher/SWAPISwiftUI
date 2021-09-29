//
//  Publisher.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/24/21.
//

import Combine

extension Publisher {
    func eraseError(using convert: @escaping (Error) -> Output) -> AnyPublisher<Output, Never> {
        self.catch { error in
            Just(convert(error))
        }.eraseToAnyPublisher()
    }
    
    func convertToLoadState() -> AnyPublisher<LoadState<Output>, Never> {
        self.map { output -> LoadState<Output> in
            .success(output)
        }.eraseError { error in
            .failure(error)
        }.eraseToAnyPublisher()
    }
}
