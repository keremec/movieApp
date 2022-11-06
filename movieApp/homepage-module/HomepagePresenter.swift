//
//  HomepagePresenter.swift
//  movieApp
//
//  Created by Kerem Safa Dirican on 6.11.2022.
//

import Foundation
import UIKit

class HomepagePresenter:VtoP_HomepageProtocol{
    var homepageInteractor: PtoI_HomepageProtocol?
    
    var homepageView: PtoV_HomepageProtocol?
    
    
    func doSearchMovie(searchString: String) {
        homepageInteractor?.searchMovie(searchString: searchString)
    }
    
    
}

extension HomepagePresenter: ItoP_HomepageProtocol{

    func movieSendtoPresenter(movieList: Array<Movies>) {
        let list = movieList
        homepageView?.movieSendtoView(movieList: list)
    }
    
}

