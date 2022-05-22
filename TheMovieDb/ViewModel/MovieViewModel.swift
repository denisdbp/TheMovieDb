//
//  MovieViewModel.swift
//  TheMovieDb
//
//  Created by Admin on 01/05/22.
//

import UIKit

class MovieViewModel: MovieServiceApiProtocol {
    
    private var moviesModel = [MovieModel]()
    private let movieServiceApi : MovieServiceApi?
    
    init(movieServiceApi : MovieServiceApi) {
        self.movieServiceApi = movieServiceApi
        self.movieServiceApi?.delegate = self
        self.movieServiceApi?.requestApi()
    }
    
    func success(movies: [MoviesObject]) {
        self.moviesModel = movies[0].results
    }
    
    func error(error: Error) {
        print("Erro ao carregar os filmes")
    }
    
    public var getMoviesCount : Int{
        return self.moviesModel.count
    }
    
    public func getIndexPath(indexPath : IndexPath) -> MovieModel{
        return self.moviesModel[indexPath.row]
    }
    
    public func getPosterPath(indexPath: IndexPath) -> Data?{
        guard let urlImage = URL(string: "https://image.tmdb.org/t/p/w500\(getIndexPath(indexPath: indexPath).poster_path)") else {return nil}
        do{
            let data = try Data(contentsOf: urlImage)
                return data
        }catch{
            print("Erro ao carregar a imagem")
        }
        return nil
    }
    
    public func getBackDropPath(indexPath: IndexPath) -> Data?{
        guard let urlImage = URL(string: "https://image.tmdb.org/t/p/w500\(getIndexPath(indexPath: indexPath).backdrop_path)") else {return nil}
        do{
            let data = try Data(contentsOf: urlImage)
                return data
        }catch{
            print("Erro ao carregar a imagem")
        }
        return nil
    }
    
    public func searchMovie(search:String)->Int{
        let result = self.moviesModel.filter({return $0.original_title == search})
        if result.count > 0 {
            self.moviesModel = result
        }else{
            self.movieServiceApi?.requestApi()
        }
        return result.count
    }
}
