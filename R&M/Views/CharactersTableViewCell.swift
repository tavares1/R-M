//
//  CharactersTableViewCell.swift
//  R&M
//
//  Created by Lucas Tavares on 21/10/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation
import UIKit

class CharactersTableViewCell: UITableViewCell, ConfigurableView {
	
	static let reuseIdentifier = "CharacterTableViewCell"
	
	let characterImage: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	let characterName: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Test"
		label.textColor = .white
		label.font = .systemFont(ofSize: 40, weight: .bold)
		label.alpha = 1.0
		return label
	}()
	
	let characterID: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "01"
		label.textColor = .lightText
		label.alpha = 1.0
		return label
	}()
	
	let shadowView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .black
		view.alpha = 0.2
		return view
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func buildHierarchy() {
		addSubviews(views: [characterImage])
		characterImage.addSubviews(views: [shadowView])
		shadowView.addSubviews(views: [characterName, characterID])
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			characterImage.topAnchor.constraint(equalTo: topAnchor),
			characterImage.trailingAnchor.constraint(equalTo: trailingAnchor),
			characterImage.leadingAnchor.constraint(equalTo: leadingAnchor),
			characterImage.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
		
		NSLayoutConstraint.activate([
			shadowView.widthAnchor.constraint(equalTo: characterImage.widthAnchor),
			shadowView.heightAnchor.constraint(equalTo: characterImage.heightAnchor, multiplier: 0.3),
			shadowView.bottomAnchor.constraint(equalTo: characterImage.bottomAnchor),
			shadowView.centerXAnchor.constraint(equalTo: characterImage.centerXAnchor)
		])
		
		NSLayoutConstraint.activate([
			
			characterName.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 8),
			characterName.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 8),
			characterName.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: -8),
			
			characterID.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: 8),
			characterID.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 8),
			characterID.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: -8),
			
		])
	}

}

extension UIView {
	func addSubviews(views: [UIView]) {
		let _ = views.map { view in
			addSubview(view)
		}
	}
}
