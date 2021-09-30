//
//  FilmRepo.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/29/21.
//

import Foundation
import Combine

protocol FilmRepoInterface {
    func getAll() -> AnyPublisher<Page<Film>, Error>
    func getNext(url: URL) -> AnyPublisher<Page<Film>, Error>
}

// conformance

final class FilmRepo : FilmRepoInterface {
    let session = URLSession.shared
    
    func getAll() -> AnyPublisher<Page<Film>, Error> {
        let url = URL(string: "https://swapi.dev/api/films")!
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Page<Film>.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func getNext(url: URL) -> AnyPublisher<Page<Film>, Error> {
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Page<Film>.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
