//
//  FilmsTabReducer.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/29/21.
//

import Foundation
import Flux

extension FilmsTab {
    static func reduce(state: SWAPIState, action: FluxAction) -> SWAPIState {
        var newState = state
        
        switch action {
            case is Actions.ViewDidAppear:
                newState.app.filmTab.loadState = .loading
                
            case let action as Actions.LoadSuccessful:
                let page = action.page
                var ids = [URL]()
                
                for film in page.results {
                    let id = film.id
                    ids.append(id)
                    newState.domain.films[id] = film
                }
                
                newState.app.filmTab.nextURL = page.next
                newState.app.filmTab.previousURL = page.previous
                newState.app.filmTab.loadState = .success(ids)
                
            case let action as Actions.LoadFailed:
                newState.app.filmTab.loadState = .failure(action.error)
                
            default: break
        }
        
        return newState
    }
}
