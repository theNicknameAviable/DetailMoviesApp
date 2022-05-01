//
//  Movie.swift
//  DetailMoviesApp
//
//  Created by Raul Bautista on 28/4/22.
//

import Foundation

struct Movies: Codable {
    var poster_path: String
    var title: String
    var overview: String
    var vote_average: Int
    var total_pages: Int
    var query: String
    
    init(poster_path: String?, title: String? = nil, overview: String? = nil, vote_average: Int? = nil, total_pages: Int? = nil, query: String? = nil) {
        self.poster_path = poster_path!
        self.title = title!
        self.overview = overview!
        self.vote_average = vote_average!
        self.total_pages = total_pages!
        self.query = query!
    }
}

struct MoviesResponse: Decodable {
    let page: Int
    let results: [Movies]
}
