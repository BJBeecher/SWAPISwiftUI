//
//  PeopleTabReducer.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/24/21.
//

import Foundation
import Flux

extension PeopleTab {
    static func reduce(state: SWAPIState, action: FluxAction) -> SWAPIState {
        var state = state
        
        switch action {
            case is Actions.ViewDidAppear:
                state.app.peopleTab.loadState = .loading
                
            case let action as Actions.PeopleLoadSuccessful:
                var names = [String]()
                
                for person in action.peoplePage.results {
                    let name = person.name
                    names.append(name)
                    state.domain.people[name] = person
                }
                
                if let existingPeople = state.app.peopleTab.loadState.successValue {
                    state.app.peopleTab.loadState = .success(existingPeople + names)
                } else {
                    state.app.peopleTab.loadState = .success(names)
                }
                
                state.app.peopleTab.nextURL = action.peoplePage.next
                state.app.peopleTab.previousURL = action.peoplePage.previous
                
            case let action as Actions.PeopleLoadFailed:
                state.app.peopleTab.loadState = .failure(action.error)
                
            default: break
        }
        
        return state
    }
}
