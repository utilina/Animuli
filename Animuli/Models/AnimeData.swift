//
//  Anime.swift
//  Animuli
//
//  Created by Анастасия Улитина on 21.11.2020.
//

import Foundation

struct AnimeData: Decodable {
    let data: [Anime]
}

struct Anime: Decodable {
    let id: String
    let attributes: AnimeAtributes
}

struct AnimeAtributes: Decodable {
    let titles: Title
    let averageRating: String
    let posterImage: ImageSize
    let status: String
}


struct Title: Decodable {
    let en_jp: String
}

struct ImageSize: Decodable {
    let small: String
    let large: String
}

