//
//  File.swift
//  MapPractice
//
//  Created by Tsering Lama on 1/3/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import Foundation

struct RandomAPI {
    
    static func getUsers(completionHandler: @escaping (Result<[Result1],AppError>) -> ()) {
        
        let userEndpoint = "https://randomuser.me/api/?results=10"
        
        guard let url = URL(string: userEndpoint) else {
            completionHandler(.failure(.badURL(userEndpoint)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case.failure(let appError):
                completionHandler(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let usersData = try JSONDecoder().decode(RandomPeople.self, from: data)
                    var userArr = [Result1]()
                    let randomUsers = usersData.results
                    
                    for users in randomUsers {
                        userArr.append(users)
                    }
                    completionHandler(.success(userArr))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            }
        }
        
    }
}


