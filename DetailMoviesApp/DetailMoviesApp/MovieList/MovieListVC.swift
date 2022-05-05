//
//  ViewController.swift
//  DetailMoviesApp
//
//  Created by Raul Bautista on 28/4/22.
//

import UIKit
import AlamofireImage
import TableviewPaginator

class MovieListVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var movieTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    let viewModel = ViewModelMovieList()
    private var tableviewPaginator: TableviewPaginator?
    


    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        movieTable.dataSource = self
        movieTable.delegate = self
        movieTable.estimatedRowHeight = 150
        searchBar.delegate = self
        viewModel.updateList = {
            self.tableviewPaginator?.incrementOffsetBy(delta: 1)
            self.tableviewPaginator?.partialDataFetchingDone()
            self.movieTable.reloadData()
        }
        tableviewPaginator = TableviewPaginator.init(paginatorUI: self, delegate: self)
        tableviewPaginator?.initialSetup()
    }

}

//MARK: - Table Methods.

extension MovieListVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = viewModel.movieList.count
        if numberOfRows == 0 {
            return 0
        }
        let tableviewPagiantorLoadeMoreCells = (tableviewPaginator?.rowsIn(section : section) ?? 0)
        return numberOfRows + tableviewPagiantorLoadeMoreCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableviewPaginator?.cellForLoadMore(at: indexPath) {
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell
        cell?.title.text = "\(viewModel.movieList[indexPath.row].title)"
        if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(viewModel.movieList[indexPath.row].poster_path)") {
            cell?.filmPoster.af.setImage(withURL: url)
        } else {
            cell?.filmPoster.image = UIImage(named: "blackImage")
        }
        cell?.filmDescription.text = "\(viewModel.movieList[indexPath.row].overview)"
        cell?.voteAverage.text = "\(viewModel.movieList[indexPath.row].vote_average)"
        return cell ?? UITableViewCell()
    }
    
    func registerTableViewCells() {
        let movieCell = UINib(nibName: "MovieCell", bundle: nil)
        let loadMoreCell = UINib(nibName: "LoadMoreCell", bundle: nil)
        movieTable.register(movieCell, forCellReuseIdentifier: "MovieCell")
        movieTable.register(loadMoreCell, forCellReuseIdentifier: "LoadMoreCell")
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let height = tableviewPaginator?.heightForLoadMore(cell: indexPath) {
            return height
        }
        return 150
    }
    
}

//MARK: - SearchBar Methods

extension MovieListVC {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.resetSearch()
        viewModel.searchMovie(query: searchText, offset: 1)
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

// MARK: - TableViewPaginator Methods (View)

extension MovieListVC: TableviewPaginatorUIProtocol {
    
    func getTableview(paginator: TableviewPaginator) -> UITableView {
        return movieTable
    }

    func shouldAddRefreshControl(paginator: TableviewPaginator) -> Bool {
        return false
    }

    func getPaginatedLoadMoreCellHeight(paginator: TableviewPaginator) -> CGFloat {
        return 150
    }

    func getPaginatedLoadMoreCell(paginator: TableviewPaginator) -> UITableViewCell {
        if let cell = movieTable.dequeueReusableCell(withIdentifier: "LoadMoreCell") as? LoadMoreCell {
            return cell
        } else {
            return UITableViewCell.init()
        }
    }

    func getRefreshControlTintColor(paginator: TableviewPaginator) -> UIColor {
        return .yellow
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
          tableviewPaginator?.scrollViewDidScroll(scrollView)
      }
}

// MARK: - TableViewPaginator Methods (Control)

extension  MovieListVC : TableviewPaginatorProtocol {

    func loadPaginatedData(offset: Int, shouldAppend: Bool, paginator: TableviewPaginator) {
        viewModel.searchMovie(query: searchBar.text ?? "", offset: offset)
    }
    
}
