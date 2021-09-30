//
//  TabAppState.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/29/21.
//

import Foundation
import Flux

extension Tab {
    struct AppState : FluxState {
        var tab = Tabskies.people
    }
}

extension Tab.AppState {
    enum Tabskies {
        case people, vehicles, films
    }
}
