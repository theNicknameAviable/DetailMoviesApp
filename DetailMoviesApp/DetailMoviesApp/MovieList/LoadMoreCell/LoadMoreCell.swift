//
//  LoadMoreCell.swift
//  DetailMoviesApp
//
//  Created by Raul Bautista on 4/5/22.
//

import UIKit

class LoadMoreCell: UITableViewCell {
    
    @IBOutlet weak var loadMore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
        
    }
    
    func configureView() {
        loadMore.textColor = .black
        loadMore.font = UIFont.systemFont(ofSize: 20)
        loadMore.text = "Load More"
        backgroundColor = .yellow
    }
    
}
