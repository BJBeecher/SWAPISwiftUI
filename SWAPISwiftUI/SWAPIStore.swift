//
//  SWAPIStore.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/23/21.
//

import Foundation
import Flux

typealias SWAPIStore = FluxStore<SWAPIState, SWAPIEnvironment>

// instance

extension SWAPIStore {
    static let shared : SWAPIStore = {
        let state = SWAPIState()
        let middlewares = [loggingMiddleware]
        let environment = SWAPIEnvironment()
        return SWAPIStore(initialState: state, reducer: reduce, middlewares: middlewares, environment: environment)
    }()
}
