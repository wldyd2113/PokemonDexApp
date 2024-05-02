//
//  PokemonDetailDTO.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/30/24.
//

import Foundation

struct PokemonDetailDTO: Decodable {
    let id: Int
    let name: String
    let sprites: PokemonSprite
    let stats: [PokemonStatsDTO]
    let types: [PokemonTypesDTO]
}
