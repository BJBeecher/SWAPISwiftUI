//
//  Person.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/23/21.
//

import Foundation

struct Person : Decodable, Equatable {
    let name : String
    let birthYear : String
    let eyeColor : String
    let gender : String
    let hairColor : String
    let height : String
    let mass : String
    let skinColor : String
    let homeworld : URL
    let films : Set<URL>
    let species : Set<URL>
    let starships : Set<URL>
    let vehicles : Set<URL>
    let url : URL
}

extension Person : Identifiable {
    var id: String {
        name
    }
}
