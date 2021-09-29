//
//  VehicleRepo.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/27/21.
//

import Foundation
import Combine

protocol VehicleRepoInterface {
    func getAll() -> AnyPublisher<Page<Vehicle>, Error>
}

// conformance

final class VehicleRepo : VehicleRepoInterface {
    let session = URLSession.shared
    
    func getAll() -> AnyPublisher<Page<Vehicle>, Error> {
        let url = URL(string: "https://swapi.dev/api/vehicles/")!
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Page<Vehicle>.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
