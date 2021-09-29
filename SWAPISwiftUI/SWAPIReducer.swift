//
//  SWAPIReducer.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/23/21.
//

import Foundation
import Flux

func reduce(state: SWAPIState, action: FluxAction) -> SWAPIState {
    var newState = state
    
    newState = PeopleTab.reduce(state: newState, action: action)
    
    return newState
}
