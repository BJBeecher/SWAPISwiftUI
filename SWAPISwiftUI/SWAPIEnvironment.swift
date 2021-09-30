//
//  SWAPIEnvironment.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/23/21.
//

import Foundation
import Flux

final class SWAPIEnvironment : FluxEnvironment {
    let personRepo : PersonRepoInterface
    let filmRepo : FilmRepoInterface
    
    init(personRepo: PersonRepoInterface, filmRepo: FilmRepoInterface){
        self.personRepo = personRepo
        self.filmRepo = filmRepo
    }
    
    convenience init() {
        let personRepo = PersonRepo()
        let filmRepo = FilmRepo()
        self.init(personRepo: personRepo, filmRepo: filmRepo)
    }
}
