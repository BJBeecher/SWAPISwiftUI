//
//  VehicleTabAppState.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/27/21.
//

import Foundation
import Flux

extension VehicleTab {
    struct AppState : FluxState {
        var loadState = LoadState<[String]>.idle
        var nextURL : URL?
        var previousURL : URL?
    }
}
