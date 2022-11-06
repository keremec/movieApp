//
//  ViewController.swift
//  movieApp
//
//  Created by Kerem Safa Dirican on 5.11.2022.
//

import UIKit

class HomepageVC: UIViewController {
    
    //MARK: - Declarations
    
    var homepagePresenterObject:VtoP_HomepageProtocol?
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movieList = [Movies]()
    
    //MARK: - Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomepageRouter.createModule(ref: self)
        
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        
        homepagePresenterObject?.doSearchMovie(searchString: "a")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toDetail":
            if let movie = sender as? Movies{
                let goalVC = segue.destination as! DetailpageVC
                goalVC.delegateDetail = self
                goalVC.movie = movie
            }
        default:
            print("identifier not found")
        }
    }
}


//MARK: - Presenter Calls

extension HomepageVC:PtoV_HomepageProtocol{
    
    func movieSendtoView(movieList: Array<Movies>) {
        self.movieList = movieList
        
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
        
    }
}


//MARK: - Tableview Actions

extension HomepageVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    //MARK: Filling Tableview
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movieList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! TableViewMovieCell
        
        cell.movieLabel.text = movie.title
        cell.movieSublabel.text = movie.specs
        cell.movieRatingButton.setTitle(movie.esrb, for: .normal)
        cell.movieCriticButton.setTitle(movie.rating_critic, for: .normal)
        cell.movieUserButton.setTitle(movie.rating_user, for: .normal)
        
        return cell
    }
    
    //MARK: Cell - Click Action
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = self.movieList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: movie)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
