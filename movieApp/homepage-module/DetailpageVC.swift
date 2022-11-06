//
//  DetailpageVC.swift
//  movieApp
//
//  Created by Kerem Safa Dirican on 6.11.2022.
//

import UIKit
import Kingfisher

class DetailpageVC: UIViewController {
    
    //MARK: - Declarations
    
    weak var delegateDetail:HomepageVC?
    
    var movie:Movies?
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var movieLabel: UILabel!
    
    @IBOutlet weak var movieSublabel: UILabel!
    
    @IBOutlet weak var movieRatingButton: UIButton!
    
    @IBOutlet weak var movieCriticButton: UIButton!
    
    @IBOutlet weak var movieUserButton: UIButton!
    
    @IBOutlet weak var moviePlotTextView: UITextView!
    
    //MARK: - Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Style
        movieImageView.layer.cornerRadius = 5.0
        
        //Data
        movieLabel.text = movie?.title
        movieSublabel.text = movie?.specs
        movieRatingButton.setTitle(movie?.esrb, for: .normal)
        movieCriticButton.setTitle(movie?.rating_critic, for: .normal)
        movieUserButton.setTitle(movie?.rating_user, for: .normal)
        moviePlotTextView.text = movie?.plot
        
        if let url = URL(string: (movie?.imgURL)!){
            DispatchQueue.main.async {
                self.movieImageView.kf.setImage(with: url, placeholder: UIImage(named: "no-poster"))
            }
        
        }
    }

}
