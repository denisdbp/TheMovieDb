//
//  ViewController.swift
//  TheMovieDb
//
//  Created by Admin on 28/04/22.
//

import UIKit

class MoviesViewController: UIViewController {
    
    private let movieViewModel : MovieViewModel = MovieViewModel(movieServiceApi: MovieServiceApi())
    private var detailsMovieViewController = DetailsMovieViewController()
    private var moviesViewScreen : MoviesViewScreen?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.moviesViewScreen?.configCollectionView(delegate: self, dataSource: self, delegateFlowLayout: self)
        self.moviesViewScreen?.delegate = self
        self.moviesViewScreen?.textFieldDelegate(delegate: self)
    }
    
    override func loadView() {
        self.moviesViewScreen = MoviesViewScreen()
        self.view = self.moviesViewScreen
    }
}

extension MoviesViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.movieViewModel.getMoviesCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesViewCellCollectionViewCell().identifier, for: indexPath) as! MoviesViewCellCollectionViewCell
        cell.imagePosterPath.image = UIImage(data: self.movieViewModel.getPosterPath(indexPath: indexPath)!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageBackDropPath = self.movieViewModel.getBackDropPath(indexPath: indexPath)
        let originalTitle = self.movieViewModel.getIndexPath(indexPath: indexPath).original_title
        let overview = self.movieViewModel.getIndexPath(indexPath: indexPath).overview
        self.detailsMovieViewController.imageData = imageBackDropPath
        self.detailsMovieViewController.originalTitle = originalTitle
        self.detailsMovieViewController.overview = overview
        self.navigationController?.pushViewController(self.detailsMovieViewController, animated: true)
    }
}

extension MoviesViewController:MovieViewScreenProtocol {
    func searchMovie(movie: String) {
        if self.movieViewModel.searchMovie(search: movie) > 0 {
            self.moviesViewScreen?.moviesCollectionView.reloadData()
        }else if movie == "" {
            self.moviesViewScreen?.moviesCollectionView.reloadData()
        }
    }
}

extension MoviesViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
