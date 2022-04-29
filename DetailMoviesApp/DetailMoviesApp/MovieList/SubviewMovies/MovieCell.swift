//
//  MovieCell.swift
//  DetailMoviesApp
//
//  Created by Raul Bautista on 29/4/22.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var filmPoster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var filmDescription: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        backgroundColor = .white
    }
}
