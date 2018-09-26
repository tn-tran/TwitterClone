//
//  User.swift
//  TwitterClone
//
//  Created by Tien Tran on 9/23/18.
//  Copyright © 2018 Tien-Enterprise. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User {
	let name: String
	let username: String
	let bioText: String
	let profileImageUrl: String
	
	
	init(json: JSON) {
		self.name = json["name"].stringValue
		self.username = json["username"].stringValue
		self.bioText = json["bio"].stringValue
		self.profileImageUrl = json["profileImageUrl"].stringValue
	}
}
