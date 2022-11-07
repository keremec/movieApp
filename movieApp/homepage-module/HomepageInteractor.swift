//
//  HomepageInteractor.swift
//  movieApp
//
//  Created by Kerem Safa Dirican on 6.11.2022.
//

import Foundation
import Alamofire

let API_KEY = "26f7e70a"

class HomepageInteractor:PtoI_HomepageProtocol{
    
    var homepagePresenter: ItoP_HomepageProtocol?
    
    func searchMovie(searchString: String) {
        
        var movieList = [Movies]()
        let encodedString = searchString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        //MARK: Searching Movies
        
        AF.request("https://www.omdbapi.com/?s=\(encodedString!)&type=movie&apikey=\(API_KEY)",method: .get).response { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(MovieSearchResponse.self, from: data)
                    for i in result.search{
                        //MARK: - Adding Movies
                        AF.request("https://www.omdbapi.com/?i=\(i.imdbID)&apikey=\(API_KEY)",method: .get).response { response in
                            if let data = response.data {
                                do{
                                    let result = try JSONDecoder().decode(MovieDetailResponse.self, from: data)
                                    let movie = Movies(id: Int(result.imdbID.dropFirst(2))!, imgURL: result.poster, title: result.title, specs: self.subLabelGenerator(year: result.year, genre: result.genre, runtime: result.runtime), plot: result.plot, rating_user: result.imdbRating, rating_critic: result.metascore, esrb: result.rated == "Not Rated" ? "N/A" : result.rated)
                                    movieList.append(movie)
                                    self.homepagePresenter?.movieSendtoPresenter(movieList: movieList)
                                    
                                }catch{
                                    self.homepagePresenter?.movieSendtoPresenter(movieList: movieList)
                                    print(error.localizedDescription)
                                }
                            }
                        }
                        //MARK: -
                    }
                    
                }catch{
                    self.homepagePresenter?.movieSendtoPresenter(movieList: movieList)
                    print(error.localizedDescription)
                }
            }
        }
    }
    
//Helper Functions
    
    func subLabelGenerator(year:String, genre:String, runtime:String) -> String {
        let duration = Int(runtime.dropLast(4)) ?? 0
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

