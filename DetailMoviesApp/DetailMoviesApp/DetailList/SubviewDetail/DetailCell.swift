//
//  DetailCell.swift
//  DetailMoviesApp
//
//  Created by Raul Bautista on 1/5/22.
//

import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
        
    }
    
    func configureView() {
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        detailLabel.textColor = .darkGray
        backgroundColor = .white
    }
    
}
