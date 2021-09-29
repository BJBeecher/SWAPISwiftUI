//
//  PersonRepo.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/23/21.
//

import Foundation
import Combine

protocol PersonRepoInterface {
    func getAll() -> AnyPublisher<Page<Person>, Error>
    func getNext(url: URL) -> AnyPublisher<Page<Person>, Error>
}

// conformance

final class PersonRepo : PersonRepoInterface {
    let session = URLSession.shared
    
    func getAll() -> AnyPublisher<Page<Person>, Error> {
        let url = URL(string: "https://swapi.dev/api/people")!
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Page<Person>.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func getNext(url: URL) -> AnyPublisher<Page<Person>, Error> {
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Page<Person>.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
