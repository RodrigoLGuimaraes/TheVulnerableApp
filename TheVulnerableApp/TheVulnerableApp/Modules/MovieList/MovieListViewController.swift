//
//  MovieListViewController.swift
//  TheVulnerableApp
//
//  Created by Rodrigo Longhi Guimarães on 08/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import UIKit

protocol MovieListView: AnyObject {
    func didFetch(movies: [Movie])
}

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var selectedIndex: IndexPath?
    private var movies: [Movie] = []
    private lazy var presenter = MovieListPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "MovieTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter.fetchMovies()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieDetails",
           let index = selectedIndex,
           let cell = tableView.cellForRow(at: index) as? MovieTableViewCell,
           let vc = segue.destination as? DetailsViewController {
            let _ = vc.view
            vc.coloredBackgroundView.backgroundColor = cell.cardView.backgroundColor
            vc.movieImageView.image = cell.movieImageView.image
            vc.movieNameLabel.text = cell.movieNameLabel.text
            vc.playButton.setImage(vc.playButton.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
            vc.playButton.setImage(vc.playButton.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .selected)
            vc.playButton.imageView?.tintColor = cell.cardView.backgroundColor
        }
    }

}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 328
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath
        self.performSegue(withIdentifier: "movieDetails", sender: self)
    }
}

extension MovieListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell
        
        let movie = movies[indexPath.row]
        
        cell.movieNameLabel.text = movie.title
        cell.scoreLabel.text = String(format: "%.0f",
                                      locale: Locale.current,
                                      arguments: [movie.voteAverage * 10]) + "%"
        
        cell.movieImageView.image = MovieImageProvider.shared.getRandomImage().image
        
        if let posterPath = movie.posterPath,
            let url = URL(string: "\(Constants.imageBaseURL)\(posterPath)") {
            cell.movieImageView.set(url: url)
        }
        
        return cell
    }
}

extension MovieListViewController: MovieListView {
    func didFetch(movies: [Movie]) {
        self.movies = movies
        self.tableView.reloadData()
    }
}
