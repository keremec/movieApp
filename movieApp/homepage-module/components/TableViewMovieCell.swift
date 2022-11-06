//
//  TableViewMovieCell.swift
//  movieApp
//
//  Created by Kerem Safa Dirican on 6.11.2022.
//

import UIKit

class TableViewMovieCell: UITableViewCell {

    @IBOutlet weak var movieImageOutlet: UIImageView!
    
    @IBOutlet weak var movieLabel: UILabel!
    
    @IBOutlet weak var movieSublabel: UILabel!
    
    @IBOutlet weak var movieRatingButton: UIButton!
    
    @IBOutlet weak var movieCriticButton: UIButton!
    
    @IBOutlet weak var movieUserButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImageOutlet.layer.cornerRadius = 5.0
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
