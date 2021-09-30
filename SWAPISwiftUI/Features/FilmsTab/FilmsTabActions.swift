//
//  FilmsTabActions.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/29/21.
//

import Foundation
import Flux
import Combine

extension FilmsTab {
    struct Actions {}
}

extension FilmsTab.Actions {
    struct LoadSuccessful : FluxAction {
        let page : Page<Film>
    }
    
    struct LoadFailed : FluxAction {
        let error : Error
    }
}

extension FilmsTab.Actions {
    final class ViewDidAppear : FluxAsyncAction<SWAPIState, SWAPIEnvironment> {
        static var token : AnyCancellable?
        
        override func sideEffects(state: SWAPIState, env: SWAPIEnvironment, dispatch: @escaping FluxDispatch) {
            Self.token = env.filmRepo.getAll()
                .map(LoadSuccessful.init)
                .eraseError(using: LoadFailed.init)
                .sink(receiveValue: dispatch)
        }
    }
}
