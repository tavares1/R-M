//
//  ContentView.swift
//  R&M
//
//  Created by Lucas Tavares on 21/10/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation
import UIKit

class ContentView: UIView, ConfigurableView {
	
	let charactersTableView = CharactersTableView(frame: .zero, style: .grouped)
//	Injetando a camada de Service no ViewModel.
	let charactersViewModel = CharactersViewModel(service: Service())

//	Inicializando a ContentView.
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
		charactersTableView.register(CharactersTableViewCell.self, forCellReuseIdentifier: CharactersTableViewCell.reuseIdentifier)
		charactersTableView.dataSource = self
		charactersTableView.delegate = self
		charactersViewModel.fetchCharacters()
		bindToViewModel()
	}
	
//	Fazendo o bind dos eventos na View.
	func bindToViewModel() {
		charactersViewModel.didUpdateList = { [weak self] chars in
			DispatchQueue.main.async{
//				self?.charactersTableView.reloadData()
			}
		}
		
		charactersViewModel.didError = { error in
			print(error)
		}
		
		charactersViewModel.didReloadData = { [weak self] in
			DispatchQueue.main.async {
				self?.charactersTableView.reloadData()
			}
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func buildHierarchy() {
		addSubview(charactersTableView)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			charactersTableView.topAnchor.constraint(equalTo: topAnchor),
			charactersTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
			charactersTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
			charactersTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}

	
}

extension ContentView: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return charactersViewModel.characters.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = charactersTableView.dequeueReusableCell(withIdentifier: CharactersTableViewCell.reuseIdentifier, for: indexPath) as? CharactersTableViewCell else { return UITableViewCell()}
		let characterViewModel = charactersViewModel.getCellModel(at: indexPath)
		cell.characterName.text = characterViewModel.characterName
		cell.characterID.text = characterViewModel.characterID
		cell.characterImage.image = UIImage(data: characterViewModel.characterImage)
		return cell
	}
}

extension ContentView: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 300.0
	}
}
