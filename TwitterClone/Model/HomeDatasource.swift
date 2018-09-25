//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Tien Tran on 9/23/18.
//  Copyright © 2018 Tien-Enterprise. All rights reserved.
//

import Foundation
import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
	let users: [User]
	required init(json: JSON) throws {
		var users = [User]()
		
		let array = json["users"].array
		for userJson in array! {
			let name = userJson["name"].stringValue
			let userName = userJson["username"].stringValue
			let bio = userJson["bio"].stringValue
			let user = User(name: name, username: userName, bioText: bio, profileImage: UIImage())
			users.append(user)
			
		}
		self.users = users
	}
//	let words = ["user1", "user2", "user3"]
	let tweets: [Tweet] = {
		let tienUser = User(name: "Tien Tran", username: "@tieen_tran", bioText: "SOME MORE BIO TEXT", profileImage: UIImage(named: "profile_image")!)
		
		let tweet = Tweet(user: tienUser, message: "Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed ")
		
		
		let testUser = User(name: "TEST", username: "@TEST", bioText: "TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ", profileImage: UIImage(named: "profile_image")!)
		let tweet2 = Tweet(user: testUser, message: "Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed Welcome to my twitter feed ")
		return [tweet, tweet2]
	}()
	
	override func footerClasses() -> [DatasourceCell.Type]? {
		return [UserFooter.self]
	}
	override func headerClasses() -> [DatasourceCell.Type]? {
		return [UserHeader.self]
	}
	override func cellClasses() -> [DatasourceCell.Type] {
		return [UserCell.self, TweetCell.self]
	}
	
	override func numberOfItems(_ section: Int) -> Int {
		if section == 1 {
			return tweets.count
		}
		
		return users.count
	}
	
	override func numberOfSections() -> Int {
		
		return 2
	}
	override func item(_ indexPath: IndexPath) -> Any? {
		if indexPath.section == 1 {
			return tweets[indexPath.item]
		}

		return users[indexPath.item]
	}
}
