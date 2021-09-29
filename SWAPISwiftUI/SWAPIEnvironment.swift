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
    
    init(personRepo: PersonRepoInterface){
        self.personRepo = personRepo
    }
    
    convenience init() {
        let personRepo = PersonRepo()
        self.init(personRepo: personRepo)
    }
}
