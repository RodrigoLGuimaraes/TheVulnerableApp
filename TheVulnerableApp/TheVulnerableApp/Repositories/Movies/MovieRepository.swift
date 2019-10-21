//
//  MovieRepository.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 10/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Moya

protocol MovieRepository {
    func search(query: String, completion: @escaping (Result<[Movie],Error>) -> Void)
    func rate(movieID: Int, value: Double, completion: @escaping (Result<Void,Error>) -> Void)
}
