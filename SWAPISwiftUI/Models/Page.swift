//
//  Page.swift
//  SWAPISwiftUI
//
//  Created by BJ Beecher on 9/23/21.
//

import Foundation

struct Page<Result: Decodable> : Decodable {
    let count : Int
    let next : URL?
    let previous : URL?
    let results : [Result]
}
