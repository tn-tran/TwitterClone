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
	let tweets: [Tweet]
	required init(json: JSON) throws {
		guard let usersJsonArray = json["users"].array, let tweetsJsonArray = json["tweets"].array else {
			throw NSError(domain: "something", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON was not valid"])
		}
		self.users = usersJsonArray.map({return User(json: $0)})
		self.tweets = tweetsJsonArray.map({return Tweet(json: $0)})
	}
	
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
