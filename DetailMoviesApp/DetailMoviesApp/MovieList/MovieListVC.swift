//
//  ViewController.swift
//  DetailMoviesApp
//
//  Created by Raul Bautista on 28/4/22.
//

import UIKit

class MovieListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var movieTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

//MARK: - Table Methods.

extension MovieListVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
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
    
}

