//
//  HomeDatasourceController+navbar.swift
//  TwitterClone
//
//  Created by Tien Tran on 9/24/18.
//  Copyright © 2018 Tien-Enterprise. All rights reserved.
//

import Foundation
import UIKit
extension HomeDatasourceController {
	 func setupNavigationBarItems() {
		setupLeftNavItems()
		setupRightNavItems()
		setupRemainingNavItems()
	}
	
	private func setupRemainingNavItems() {
		let titleImageView = UIImageView(image: UIImage(named: "title_icon"))
		titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
		titleImageView.contentMode = .scaleAspectFit
		navigationItem.titleView = titleImageView
		navigationController?.navigationBar.backgroundColor = .white
		navigationController?.navigationBar.isTranslucent = false
	}
	private func setupLeftNavItems() {
		
		let followButton = UIButton(type: .system)
		followButton.setImage(UIImage(named: "follow")?.withRenderingMode(.alwaysOriginal), for: .normal)
		followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
	}
	
	private func setupRightNavItems() {
		let searchButton = UIButton(type: .system)
		searchButton.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), for: .normal)
		searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
		
		let composeButton = UIButton(type: .system)
		composeButton.setImage(UIImage(named: "compose")?.withRenderingMode(.alwaysOriginal), for: .normal)
		
		composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
		
		navigationItem.rightBarButtonItems = [ UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
	}
}
