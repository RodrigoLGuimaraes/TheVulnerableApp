//
//  MovieRepositoryImpl.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 10/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Foundation

enum MovieRequestError: Error {
    case notFound
}

class MovieRepositoryImpl: MovieRepository {
    private let service: MovieService
    
    init(service: MovieService = MovieServiceImpl()) {
        self.service = service
    }
    
    func search(query: String, completion: @escaping (Result<[Movie],Error>) -> Void) {
        service.search(query: query) { (result) in
            if case .success(let response) = result,
                let movies = try? response.map([Movie].self, atKeyPath: "results") {
                completion(.success(movies))
                return
            }
            
            completion(.failure(MovieRequestError.notFound))
        
        }
    }
    
    
}
