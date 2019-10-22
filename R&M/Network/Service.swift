//
//  Service.swift
//  R&M
//
//  Created by Lucas Tavares on 21/10/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation

extension URLSession {
	func dataTask(url: URL, result: @escaping(Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask{
		return dataTask(with: url) { (data, response, error) in
			if let error = error {
				result(.failure(error))
				return
			}
			
			guard let response = response, let data = data else {
				let error = NSError(domain: "error", code: 0, userInfo: nil)
				result(.failure(error))
				return
			}
			
			result(.success((response,data)))
		}
	}
}


class Service {
	public func get<T: Codable>(url: URL, completion: @escaping ((Result<T,Error>) -> Void)) {
		URLSession.shared.dataTask(url: url, result: { (result) in
			switch result {
			case .success( _ , let data):
				do {
					let values =  try JSONDecoder().decode(T.self, from: data)
					completion(.success(values))
				} catch {
					completion(.failure(error))
				}
			case .failure(let error):
				completion(.failure(error))
			}
		}).resume()
	}
	
	public func getAllCharacters(completion: @escaping ((Result<Characters, Error>) -> Void)) {
		get(url: URL(string: "https://rickandmortyapi.com/api/character/")!) { (result: Result<Characters, Error>) in
			switch result {
			case .success(let values):
				completion(.success(values))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
}
