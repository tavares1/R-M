//
//  Characters.swift
//  R&M
//
//  Created by Lucas Tavares on 21/10/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation

struct Characters: Codable {
	let info: Info
	let results: [Character]
}

struct Info: Codable {
	let count: Int
	let pages: Int
	let next: String
	let prev: String
}

