//
//  NetworkWorker.swift
//  DetailMoviesApp
//
//  Created by Raul Bautista on 29/4/22.
//

import Foundation
import Alamofire

class NetworkWorker {
    
    static let apiKey = "cd342d8312c81508538c19fdf63cc308"
    
    func request(completionBlock: @escaping (([Movies]) -> Void)) {
        let url = "https://api.themoviedb.org/3/search/movie?api_key=\(NetworkWorker.apiKey)&poster_path=null&page=1&title=Batman&overeview=empty&vote_average&query=batman"
        AF.request(url).responseDecodable(of: MoviesResponse.self) { response in
            let movies = try? response.result.get().results
            completionBlock(movies ?? [])
        }
    }
    
}
