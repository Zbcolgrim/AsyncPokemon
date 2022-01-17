//
//  Pokemon.swift
//  PokeFetch
//
//  Created by Zachary Buffington on 1/17/22.
//

import Foundation

struct PokemonAPIResponse: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
}
