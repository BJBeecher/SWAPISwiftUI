//
//  PeopleTabActions.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/24/21.
//

import Foundation
import Flux
import Combine

extension PeopleTab {
    struct Actions {}
}

// synch

extension PeopleTab.Actions {
    struct PeopleLoadSuccessful : FluxAction {
        let peoplePage : Page<Person>
    }
    
    struct PeopleLoadFailed : FluxAction {
        let error : Error
    }
}

// async actions
    
extension PeopleTab.Actions {
    class ViewDidAppear : FluxAsyncAction<SWAPIState, SWAPIEnvironment> {
        static var token : AnyCancellable?
        
        override func sideEffects(state: SWAPIState, env: SWAPIEnvironment, dispatch: @escaping FluxDispatch) {
            Self.token = env.personRepo.getAll()
                .map(PeopleLoadSuccessful.init)
                .eraseError(using: PeopleLoadFailed.init)
                .sink(receiveValue: dispatch)
        }
    }
    
    class LoadNext : FluxAsyncAction<SWAPIState, SWAPIEnvironment> {
        static var token : AnyCancellable?
        
        override func sideEffects(state: SWAPIState, env: SWAPIEnvironment, dispatch: @escaping FluxDispatch) {
            guard let url = state.app.peopleTab.nextURL else { return }
            
            Self.token = env.personRepo.getNext(url: url)
                .map(PeopleLoadSuccessful.init)
                .eraseError(using: PeopleLoadFailed.init)
                .sink(receiveValue: dispatch)
        }
    }
}
