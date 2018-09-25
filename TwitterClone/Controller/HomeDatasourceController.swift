//
//  HomeDatasourceController.swift
//  TwitterClone
//
//  Created by Tien Tran on 9/23/18.
//  Copyright © 2018 Tien-Enterprise. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit
import TRON
import SwiftyJSON



class HomeDatasourceController: DatasourceController {
	override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
		collectionViewLayout.invalidateLayout()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView.backgroundColor = UIColor(r: 232, g: 236, b: 241)
		setupNavigationBarItems()
//		let homeDatasource = HomeDatasource()
//		self.datasource = homeDatasource
	fetchHomeFeed()
	}

	
	let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
	
	class Home: JSONDecodable {
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
	}
	class JSONError: JSONDecodable {
		required init(json: JSON) throws {
			print("JSON ERROR:")
		}
	}
	
	fileprivate func fetchHomeFeed() {
		// start our json fetch
		
		let request: APIRequest<HomeDatasource, JSONError> = tron.swiftyJSON.request("/twitter/home")
		request.perform(withSuccess: { (homeDataSource) in
			print("Successfully fetched our json object")
			self.datasource = homeDataSource
			print(homeDataSource.users.count)
		}) { (error) in
			print("failed to fetch json")
		}
		// alternative, use tron instead of URLSESSION
//		URLSession.shared.dataTask(with: <#T##URL#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		
		if let user = self.datasource?.item(indexPath) as? User {
			//user.bioText
			// let's get an estimation of the height of our cell based on user.bioText
			let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 8 - 10 // gave too much width, so shrink the width to get taller height
			let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
			let attributes: [NSAttributedString.Key: Any] = [
			.font : UIFont.systemFont(ofSize: 15)
			]
			let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
			
			return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
		}
		return CGSize(width: view.frame.width, height: 200)
		
	}
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		if section == 1 {
			return .zero
		}
		return CGSize(width: view.frame.width, height: 50)
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
		if section == 1 {
			return .zero
		}
		
		return CGSize(width: view.frame.width, height: 64)
	}
}


