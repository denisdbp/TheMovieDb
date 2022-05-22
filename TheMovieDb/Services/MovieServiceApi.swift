//
//  MovieServiceApi.swift
//  TheMovieDb
//
//  Created by Admin on 01/05/22.
//

import UIKit

protocol MovieServiceApiProtocol {
    func success(movies : [MoviesObject])
    func error(error : Error)
}

class MovieServiceApi {
    
    var delegate : MovieServiceApiProtocol?
    
    private var apiKey = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=0f9a3cef12bf5788122f13b1532b9b9e&language=pt-BR")
    
    public func requestApi(){
        guard let apiKey = apiKey else {return}
        let request = URLSession.shared.dataTask(with: apiKey){(data, response, error) in
            if let data = data {
                do{
                let json = try JSONDecoder().decode(MoviesObject.self, from: data)
                    self.delegate?.success(movies: [json])
                }catch{
                   print("Erro ao carregar os filmes")
                }
                if let error = error {
                    self.delegate?.error(error: error)
                }
            }
        }
        request.resume()
    }
}
