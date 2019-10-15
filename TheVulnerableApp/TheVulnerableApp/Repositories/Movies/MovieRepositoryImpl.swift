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
            
            guard case .success(let response) = result else {
                DispatchQueue.main.async {
                    completion(.failure(MovieRequestError.notFound))
                }
                return
            }
            
            do {
                let movies = try response.map([Movie].self, atKeyPath: "results")
                
                DispatchQueue.main.async {
                    completion(.success(movies))
                }
            } catch {
                completion(.failure(MovieRequestError.notFound))
            }
            
        }
    }
    
    
}
