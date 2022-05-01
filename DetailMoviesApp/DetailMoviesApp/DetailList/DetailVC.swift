//
//  DetailVC.swift
//  DetailMoviesApp
//
//  Created by Raul Bautista on 28/4/22.
//

import UIKit

class DetailListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var detailTable: UITableView!
    var titleMovie:String? = ""
    var overview:String? = ""
    var vote_average:String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        detailTable.dataSource = self
        detailTable.delegate = self
        detailTable.estimatedRowHeight = 120
    }
}

//MARK: - Table Methods.

extension DetailListVC {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detalle-celda", for: indexPath) as? DetailCell
            switch indexPath.row {
              case 0:
                cell?.titleLabel.text = "Title"
                cell?.detailLabel.text = self.titleMovie ?? "Not Available"
              case 1:
                cell?.titleLabel.text = "Overview"
                cell?.detailLabel.text = self.overview ?? "Not Available"
              case 2:
                cell?.titleLabel.text = "Vote Average"
                cell?.detailLabel.text = self.vote_average ?? "Not Available"
            default: break
            }
            return cell!
    }
    
    func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "DetailCell",bundle: nil)
        detailTable.register(textFieldCell,forCellReuseIdentifier: "detalle-celda")
    }
}

