//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Tien Tran on 9/23/18.
//  Copyright © 2018 Tien-Enterprise. All rights reserved.
//

import Foundation
import LBTAComponents

class HomeDatasource: Datasource {
	let users: [User] = {
		let tienUser = User(name: "Tien Tran", username: "@tieen_tran", bioText: "SOME MORE BIO TEXT", profileImage: UIImage(named: "profile_image")!)
		
		let testUser = User(name: "TEST", username: "@TEST", bioText: "TESTTEST", profileImage: UIImage(named: "profile_image")!)
		return [tienUser, testUser]
	}()
//	let words = ["user1", "user2", "user3"]
	
	override func footerClasses() -> [DatasourceCell.Type]? {
		return [UserFooter.self]
	}
	override func headerClasses() -> [DatasourceCell.Type]? {
		return [UserHeader.self]
	}
	override func cellClasses() -> [DatasourceCell.Type] {
		return [UserCell.self]
	}
	
	override func numberOfItems(_ section: Int) -> Int {
		return users.count
	}
	override func item(_ indexPath: IndexPath) -> Any? {
		return users[indexPath.item]
	}
}
