//
//  FilmsTabScopeState.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/29/21.
//

import Foundation

extension FilmsTab {
    struct ScopeState : Equatable {
        var loadState : LoadState<[Film]>
        
        init(state: SWAPIState){
            self.loadState = state.app.filmTab.loadState.mapSuccess { urls in
                urls.compactMap { url in
                    state.domain.films[url]
                }
            }
        }
    }
}
