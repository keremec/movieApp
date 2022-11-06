//
//  HomepageInteractor.swift
//  movieApp
//
//  Created by Kerem Safa Dirican on 6.11.2022.
//

import Foundation

class HomepageInteractor:PtoI_HomepageProtocol{
    
    var homepagePresenter: ItoP_HomepageProtocol?
    
    func searchMovie(searchString: String) {
        
        var movieList = [Movies]()
        
        let cell1 = Movies(id: 23, imgURL: "https://m.media-amazon.com/images/M/MV5BYzg0NGM2NjAtNmIxOC00MDJmLTg5ZmYtYzM0MTE4NWE2NzlhXkEyXkFqcGdeQXVyMTA4NjE0NjEy._V1_SX300.jpg", title: "Blade Runner 2049", specs: "2017 | Action, Adventure | 2h43m", plot: "DENEME", rating_user: " 3.3", rating_critic: " 33", esrb: "PG-14")
        
        movieList.append(cell1)
        movieList.append(cell1)
        movieList.append(cell1)
        movieList.append(cell1)
        movieList.append(cell1)
        movieList.append(cell1)
        
        self.homepagePresenter?.movieSendtoPresenter(movieList: movieList)
    }
    
}
