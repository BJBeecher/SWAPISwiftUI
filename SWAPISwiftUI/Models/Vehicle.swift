//
//  Vehicle.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/27/21.
//

import Foundation

struct Vehicle : Decodable {
    let name : String
    let model : String
    let vehicleClass : String
    let manufacturer : String
    let length : String
    let costInCredits : String
    let crew : String
    let passengers : String
    let maxAtmospheringSpeed : String
    let cargoCapacity : String
    let consumables : String
    let films : [URL]
    let pilots : [URL]
}
