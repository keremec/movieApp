//
//  HomepageProtocol.swift
//  movieApp
//
//  Created by Kerem Safa Dirican on 6.11.2022.
//

import Foundation

//MARK: Main Protocols

protocol VtoP_HomepageProtocol{
    var homepageInteractor:PtoI_HomepageProtocol? {get set}
    var homepageView:PtoV_HomepageProtocol? {get set}
    
    func doSearchMovie(searchString:String)
}

protocol PtoI_HomepageProtocol{
    var homepagePresenter:ItoP_HomepageProtocol? {get set}
    
    func searchMovie(searchString:String)
}


// MARK: Transport Protocols

protocol ItoP_HomepageProtocol{
    func movieSendtoPresenter(movieList:Array<Movies>)
}

protocol PtoV_HomepageProtocol{
    func movieSendtoView(movieList:Array<Movies>)
}

//MARK: Router

protocol PtoR_HomepageProtocol{
    static func createModule(ref:HomepageVC)
}
