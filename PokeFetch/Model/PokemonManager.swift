//
//  PokemonManager.swift
//  PokeFetch
//
//  Created by Zachary Buffington on 1/17/22.
//

import Foundation

class PokemonManager {
    func fetchPokemon() async throws -> [Pokemon] {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=151")!
        
        let response = try await URLSession.shared.data(from: url)
        
        let data = response.0
        
        let decoder = JSONDecoder()
        let apiResponse = try decoder.decode(PokemonAPIResponse.self, from: data)
    
        return apiResponse.results
    }
}
