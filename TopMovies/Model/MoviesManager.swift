//
//  MoviesManager.swift
//  TopMovies
//
//  Created by Shaimaa Mohammed on 01/05/2021.
//

import Foundation

protocol MoviesManagerDelgate {
    func setMoviesArray(moviesArray: [MovieModel])
}

struct MoviesManager {
    
    var delegate: MoviesManagerDelgate?
    
    func fetchMovies (sortType: String) {
        let urlString = "\(C.API.url)\(sortType)?api_key=\(C.API.key)"
        performRequest(urlString: urlString)
    }
    
    //networking
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let responseData = data {
                    if let moviesData = self.parseJSON(moviesData: responseData){
                        self.delegate?.setMoviesArray(moviesArray: moviesData.results)
                    }
                }
            }
            task.resume()
        }
    }
    
    //parsing JSON to Movies
    func parseJSON(moviesData: Data) -> MoviesData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MoviesData.self, from: moviesData)
            print(decodedData.results[0].original_title)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
    
}
