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
extension Collection where Iterator.Element == JSON {
	func decode<T: JSONDecodable>() throws -> [T] {
		return try map{try T(json: $0)}
	}
}

class HomeDatasource: Datasource, JSONDecodable {
	let users: [User]
	let tweets: [Tweet]
	required init(json: JSON) throws {
		guard let usersJsonArray = json["users"].array, let tweetsJsonArray = json["tweets"].array else {
			throw NSError(domain: "something", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON was not valid"])
		}
//		self.users = usersJsonArray.map({return User(json: $0)})
//		self.tweets = tweetsJsonArray.map({return Tweet(json: $0)})
		
		
		self.users = try usersJsonArray.decode()
		self.tweets = try tweetsJsonArray.decode()
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
