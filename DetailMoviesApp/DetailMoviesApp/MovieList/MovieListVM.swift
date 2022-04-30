//
//  MovieListVM.swift
//  DetailMoviesApp
//
//  Created by Raul Bautista on 28/4/22.
//

import Foundation

class ViewModelMovieList {
    
    var movieList: [Movies] = []
    let networker: NetworkWorker
    var updateList: (() -> Void)?
    
    init (networker: NetworkWorker = NetworkWorker()){
        self.networker = networker
    }
    
    func loadMovies() {
        receiveMovies()
    }
    
    func receiveMovies() {
        networker.request { movieList in
            self.movieList = movieList
            self.updateList?()
        }
    }
    
    func searchMovie(query: String){
        networker.searchMovie(query: query) { results in
            self.movieList = results
            self.updateList?()
        }
    }
}
