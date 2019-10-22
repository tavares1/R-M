//
//  CharacterViewModel.swift
//  R&M
//
//  Created by Lucas Tavares on 21/10/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation

class CharacterViewModel {
	
	private let characterImageLink: String
	var characterImage: Data
	let characterName: String
	let characterID: String
	
//	Events
	var didFetchImage:((Data?) -> Void)?
//
	
	init( _ character: Character) {
		self.characterName = character.name
		self.characterID = "\(character.id)"
		self.characterImageLink = character.image
		self.characterImage = Data()
	}
	
	public func fetchImage(completion: @escaping((Data?) -> Void)) {
		guard let url = URL(string: self.characterImageLink) else { return }
		URLSession.shared.dataTask(url: url) { (result) in
			switch result{
			case.success(_,let data):
				completion(data)
			case.failure(let error):
				print(error)
				completion(nil)
			}
		}.resume()
		
	}
}
