//
//  SWAPIState.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/23/21.
//

import Foundation
import Flux

struct SWAPIState : FluxState {
    var app = AppState()
    var domain = DomainState()
}

extension SWAPIState {
    struct AppState : FluxState {
        var peopleTab = PeopleTab.AppState()
        var vehicleTab = VehicleTab.AppState()
    }
}

// domain state can be moved to DB (CoreData, SQLLite, etc.)

extension SWAPIState {
    struct DomainState : FluxState {
        var people = [String : Person]()
        var vehicles = [String : Vehicle]()
    }
}
