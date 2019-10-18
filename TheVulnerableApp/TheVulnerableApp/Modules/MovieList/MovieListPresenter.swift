//
//  MovieListPresenter.swift
//  TheVulnerableApp
//
//  Created by Charles Lima on 10/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Foundation

class MovieListPresenter {
    
    private weak var view: MovieListView?
    private let repository: MovieRepository
    
    init(view: MovieListView,
         repository: MovieRepository = MovieRepositoryImpl()) {
        self.view = view
        self.repository = repository
    }
    
    func fetchMovies() {
        repository.search(query: "Avengers") { (result) in
            if case .success(let movies) = result {
                self.view?.didFetch(movies: movies)
                return
            }
            self.view?.didFetch(movies: [])
        }
    }
}
