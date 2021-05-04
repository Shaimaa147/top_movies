//
//  Constants.swift
//  TopMovies
//
//  Created by Shaimaa Mohammed on 01/05/2021.
//

import Foundation

struct C {
    
    static let moviesCellIdentifier = "MovieColletionViewCell"
    
    struct API {
        static let url = "https://api.themoviedb.org/3/movie/"
        static let key = "3bc7fc251e3371b230714f8a4a7cbb30"
    }
    
    struct SortTypes {
        static let popular = "popular"
        static let rate = "top_rated"
    }
}
