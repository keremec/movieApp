//
//  HomepageInteractor.swift
//  movieApp
//
//  Created by Kerem Safa Dirican on 6.11.2022.
//

import Foundation
import Alamofire

class HomepageInteractor:PtoI_HomepageProtocol{
    
    var homepagePresenter: ItoP_HomepageProtocol?
    
    func searchMovie(searchString: String) {
        
        var movieList = [Movies]()
        
        //MARK: Searching Movies
        
        AF.request("https://www.omdbapi.com/?s=deadpool+2&type=movie&apikey=26f7e70a",method: .get).response { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(MovieSearchResponse.self, from: data)
                    for i in result.search{
                        //MARK: - Adding Movies
                        AF.request("https://www.omdbapi.com/?i=\(i.imdbID)&apikey=26f7e70a",method: .get).response { response in
                            if let data = response.data {
                                do{
                                    let result = try JSONDecoder().decode(MovieDetailResponse.self, from: data)
                                    let movie = Movies(id: Int(result.imdbID.dropFirst(2))!, imgURL: result.poster, title: result.title, specs: self.subLabelGenerator(year: result.year, genre: result.genre, runtime: result.runtime), plot: result.plot, rating_user: result.imdbRating, rating_critic: result.metascore, esrb: result.rated)
                                    movieList.append(movie)
                                    self.homepagePresenter?.movieSendtoPresenter(movieList: movieList)
                                    
                                }catch{
                                    print(error.localizedDescription)
                                }
                            }
                        }
                        //MARK: -
                    }
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
//Helper Functions
    
    func subLabelGenerator(year:String, genre:String, runtime:String) -> String {
        var duration = Int(runtime.dropLast(4)) ?? 0
        print(duration)
        let hours = duration / 60
        let minutes = duration % 60
        if hours > 0{
            return "\(year) | \(genre) | \(hours)h\(minutes)m"
        }
        else if minutes > 0{
            return "\(year) | \(genre) | \(minutes)m"
        }
        else{
            return "\(year) | \(genre)"
        }
    }
    
    
}

