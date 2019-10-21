//
//  DetailsPresenter.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 21/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Foundation

class DetailsPresenter {
    
    private weak var view: DetailsViewController?
    private let repository: MovieRepository
    
    init(view: DetailsViewController,
         repository: MovieRepository = MovieRepositoryImpl()) {
        self.view = view
        self.repository = repository
    }
    
    func rate(movieID: Int, value: Int) {
        repository.rate(movieID: movieID, value: Double(value * 2)) { (result) in
            guard case .success = result else {
                print("rate failed")
                return
            }
            
            print("rate success")
        }
    }
}
