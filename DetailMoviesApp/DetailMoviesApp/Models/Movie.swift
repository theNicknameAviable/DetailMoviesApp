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
}

struct MoviesResponse: Decodable {
    let page: Int
    let results: [Movies]
}
