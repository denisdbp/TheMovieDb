//
//  MovieModel.swift
//  TheMovieDb
//
//  Created by Admin on 01/05/22.
//

import Foundation

struct MoviesObject: Decodable {
    let results : [MovieModel]
}

struct MovieModel: Decodable {
    let original_title : String
    let overview : String
    let backdrop_path : String
    let poster_path : String
    
    enum CodingKeys: String, CodingKey {
        case original_title
        case overview
        case backdrop_path
        case poster_path
    }
}
