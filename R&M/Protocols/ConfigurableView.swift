//
//  ConfigurableView.swift
//  R&M
//
//  Created by Lucas Tavares on 21/10/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation

protocol ConfigurableView {
	func setupView()
	func buildHierarchy()
	func setupConstraints()
}

extension ConfigurableView {
	func setupView () {
		buildHierarchy()
		setupConstraints()
	}
}
