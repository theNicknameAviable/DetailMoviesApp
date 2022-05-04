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
    
    func searchMovie(query: String, offset: Int){
        networker.searchMovie(query: query, offset: offset) { results in
            self.movieList = results
            self.updateList?()
        }
    }
}
