//
//  PeopleTabScopeState.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/24/21.
//

import Foundation

extension PeopleTab {
    struct ScopeState : Equatable {
        let loadState : LoadState<[Person]>
        let canLoadMore : Bool
        
        init(state: SWAPIState){
            self.loadState = state.app.peopleTab.loadState.mapSuccess { names in
                names.compactMap {
                    state.domain.people[$0]
                }
            }
            
            self.canLoadMore = state.app.peopleTab.nextURL != nil
        }
    }
}
