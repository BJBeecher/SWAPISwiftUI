//
//  FilmsTabAppState.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/29/21.
//

import Foundation
import Flux

extension FilmsTab {
    struct AppState : FluxState {
        var loadState = LoadState<[URL]>.idle
        var nextURL : URL?
        var previousURL : URL?
    }
}
