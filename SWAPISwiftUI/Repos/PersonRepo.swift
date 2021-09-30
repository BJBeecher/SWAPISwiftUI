//
//  PersonRepo.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/23/21.
//

import Foundation
import Combine

protocol PersonRepoInterface {
    @available(iOS 15.0.0, *)
    func getAll() async throws -> Page<Person>
    func getAll() -> AnyPublisher<Page<Person>, Error>
    func getNext(url: URL) -> AnyPublisher<Page<Person>, Error>
}

// conformance

final class PersonRepo : PersonRepoInterface {
    let session = URLSession.shared
    let baseURL = URL(string: "https://swapi.dev/api/people")!
    let decoder : JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    @available(iOS 15.0.0, *)
    func getAll() async throws -> Page<Person> {
        let (data, _) = try await URLSession.shared.data(from: baseURL, delegate: nil)
        let page = try decoder.decode(Page<Person>.self, from: data)
        return page
    }
    
    func getAll() -> AnyPublisher<Page<Person>, Error> {
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return session.dataTaskPublisher(for: baseURL)
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
