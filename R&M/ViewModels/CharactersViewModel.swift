//
//  CharactersViewModel.swift
//  R&M
//
//  Created by Lucas Tavares on 21/10/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation

class CharactersViewModel {
	
//	Observed Property
	private var cellViewModels: [CharacterViewModel] = [CharacterViewModel]() {
		didSet {
			self.didReloadData?()
		}
	}
	
	var characters: [Character] {
		didSet{
			self.didUpdateList?(self.characters)
		}
	}
	
	var numberOfCell: Int {
		return characters.count
	}
	
//	Events
	var didUpdateList: (([Character]) -> Void)?
	var didError: ((Error) -> Void)?
	var didReloadData: (() -> ())?
	
//	Service
	private var service: Service
	
//	Constructor
	init (service: Service) {
		self.service = service
		self.characters = []
	}
	
//	ViewModel Functions
	public func fetchCharacters() {
		service.getAllCharacters { (result) in
			switch result {
			case.success(let chars):
				self.characters = chars.results
				self.setupCellViewModels()
			case .failure(let error):
				self.didError?(error)
			}
		}
	}
	
	public func setupCellViewModels() {
		let _ = characters.map { (char) in
			let characterVM = CharacterViewModel(char)
			characterVM.fetchImage { (data) in
				characterVM.characterImage = data!
			}
			cellViewModels.append(characterVM)
		}
	}
	
	public func getCellModel(at indexPath: IndexPath) -> CharacterViewModel {
		return cellViewModels[indexPath.row]
	}
}
