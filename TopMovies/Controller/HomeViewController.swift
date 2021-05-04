//
//  HomeViewController.swift
//  TopMovies
//
//  Created by Shaimaa Mohammed on 01/05/2021.
//

import UIKit
import SDWebImage


class HomeViewController: UIViewController, MoviesManagerDelgate {
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    var movies = [MovieModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        var moviesManager = MoviesManager()
        moviesManager.delegate  = self
        moviesManager.fetchMovies(sortType: C.SortTypes.popular)
        
    }
    
    func setMoviesArray(moviesArray: [MovieModel]) {
        movies = moviesArray
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - CollectionView dataSource extension
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: C.moviesCellIdentifier, for: indexPath)

        let movieImageView = cell.viewWithTag(3) as! UIImageView
        let posterURL = "https://image.tmdb.org/t/p/w185\(movies[indexPath.row].poster_path)"
        movieImageView.sd_setImage(
            with: URL(string: posterURL)!,
            placeholderImage: UIImage(named: "image-placeholder")
         )
        
        return cell
    }
    
    
}

//MARK: - CollectionView delegate extension
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moviesCollectionView.deselectItem(at: indexPath, animated: true)
        print("you taped \(indexPath)")
    }
}

// MARK: - Collection View Flow Layout Delegate
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
}
