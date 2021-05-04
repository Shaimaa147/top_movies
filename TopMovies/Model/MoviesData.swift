//
//  MovieData.swift
//  TopMovies
//
//  Created by Shaimaa Mohammed on 01/05/2021.
//

import Foundation

struct MoviesData: Codable {
    let page: Int
    let results: [MovieModel]
    
}

struct MovieModel: Codable {
    let id: Int
    let original_title: String
    let overview: String
    let release_date: String
    let vote_average: Double
    let poster_path: String
    
}
