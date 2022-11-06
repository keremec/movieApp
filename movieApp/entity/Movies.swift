//
//  Movies.swift
//  movieApp
//
//  Created by Kerem Safa Dirican on 6.11.2022.
//

import Foundation

class Movies{
        
    var id:Int?
    var imgURL:String?
    var title:String?
    var specs:String?
    var plot:String?
    var rating_user:String?
    var rating_critic:String?
    var esrb:String?
    
    init(id:Int, imgURL:String, title:String, specs:String, plot:String, rating_user:String, rating_critic:String, esrb:String) {
        self.id = id
        self.imgURL = imgURL
        self.title = title
        self.specs = specs
        self.plot = plot
        self.rating_user = rating_user
        self.rating_critic = rating_critic
        self.esrb = esrb
    }
    
}
