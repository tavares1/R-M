//
//  CharactersTableView.swift
//  R&M
//
//  Created by Lucas Tavares on 21/10/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation
import UIKit

class CharactersTableView: UITableView {
	
	override init(frame: CGRect, style: UITableView.Style) {
		super.init(frame: frame, style: .grouped)
		translatesAutoresizingMaskIntoConstraints = false
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}



