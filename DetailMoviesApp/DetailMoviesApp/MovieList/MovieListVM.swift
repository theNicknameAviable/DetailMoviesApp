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
    
    init (networker: NetworkWorker = NetworkWorker()){
        self.networker = networker
    }
}
