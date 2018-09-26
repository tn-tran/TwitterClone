//
//  Tweet.swift
//  TwitterClone
//
//  Created by Tien Tran on 9/24/18.
//  Copyright © 2018 Tien-Enterprise. All rights reserved.
//

import Foundation
import SwiftyJSON
struct Tweet {
	let user: User
	let message: String
	
	init(json: JSON) {
		let userJson = json["user"]
		self.user = User(json: userJson)
		self.message = json["message"].stringValue
	}
}
