//
//  PeopleTabAppState.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/24/21.
//

import Foundation
import Flux

extension PeopleTab {
    struct AppState : FluxState {
        var loadState = LoadState<[URL]>.idle
        var nextURL : URL?
        var previousURL : URL?
    }
}
