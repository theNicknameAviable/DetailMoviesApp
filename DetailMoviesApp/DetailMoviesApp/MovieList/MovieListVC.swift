//
//  ViewController.swift
//  DetailMoviesApp
//
//  Created by Raul Bautista on 28/4/22.
//

import UIKit

class MovieListVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var movieTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    let viewModel = ViewModelMovieList()


    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        movieTable.dataSource = self
        movieTable.delegate = self
        movieTable.estimatedRowHeight = 120
        searchBar.delegate = self
        viewModel.updateList = {
            self.movieTable.reloadData()
        }
    }
}

//MARK: - Table Methods.

extension MovieListVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell
        cell?.title.text = "\(viewModel.movieList[indexPath.row].title)"
        //cell?.filmPoster.image = UIImage
        cell?.filmDescription.text = "\(viewModel.movieList[indexPath.row].overview)"
        cell?.voteAverage.text = "\(viewModel.movieList[indexPath.row].vote_average)"
        return cell ?? UITableViewCell()
    }
    
    func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "MovieCell", bundle: nil)
        movieTable.register(textFieldCell, forCellReuseIdentifier: "MovieCell")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return NSLocalizedString("Movies", comment: "")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let film = viewModel.movieList[indexPath.row]
        showMovieDetail(film: film)
    }
    
}

//MARK: - SearchBar Methods

extension MovieListVC {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchMovie(query: searchText)
    }
    
}

// MARK: - Movie Detail - Detail List VC

extension MovieListVC {
    
    func showMovieDetail(film : Movies) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "DetailVC") as? DetailListVC else {return}
        detailViewController.titleMovie = film.title
        detailViewController.overview = film.overview
        detailViewController.vote_average = "\(film.vote_average)"
        present(detailViewController, animated: true, completion: nil)
    }
}

