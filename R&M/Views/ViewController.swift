//
//  ViewController.swift
//  R&M
//
//  Created by Lucas Tavares on 21/10/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import UIKit

enum Links:String {
	case character = "https://rickandmortyapi.com/api/character/1"
}

class ViewController: UIViewController {

	var contentView = ContentView(frame: .zero)
	override func viewDidLoad() {
		super.viewDidLoad()
		view = contentView
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.title = "Rick And Morty Wiki"
	}
}

