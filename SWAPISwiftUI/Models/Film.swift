//
//  Film.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/29/21.
//

import Foundation

struct Film : Decodable, Equatable {
    let url : URL
    let title : String
    let episodeId : Int
    let openingCrawl : String
    let director : String
    let producer : String
    let species : [URL]
    let vehicles : [URL]
    let characters : [URL]
    let planets : [URL]
}

extension Film : Identifiable {
    var id : URL {
        url
    }
}
