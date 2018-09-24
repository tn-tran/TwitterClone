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



class HomeDatasourceController: DatasourceController {
	override func viewDidLoad() {
		super.viewDidLoad()
		let homeDatasource = HomeDatasource()
		self.datasource = homeDatasource
		
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
		return CGSize(width: view.frame.width, height: 50)
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
		return CGSize(width: view.frame.width, height: 50)
	}
}


