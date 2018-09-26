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
	let errorMessageLabel: UILabel = {
		let label = UILabel()
		label.text = "Apologies something went wrong. Please try again later..."
		label.textAlignment = .center
		label.isHidden = true
		label.numberOfLines = 0
		return label
	}()
	
	override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
		collectionViewLayout.invalidateLayout()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(errorMessageLabel)
		errorMessageLabel.fillSuperview() // LBTA method to anchor the view
		collectionView.backgroundColor = UIColor(r: 232, g: 236, b: 241)
		setupNavigationBarItems()

		Service.sharedInstance.fetchHomeFeed { (homeDatasource, err) in
			if let err = err {
				self.errorMessageLabel.isHidden = false
				if let apiError = err as? APIError<Service.JSONError> {
					if apiError.response?.statusCode != 200 {
						self.errorMessageLabel.text = "Status code was not 200"
					}
				}
				return
			}
			self.datasource = homeDatasource
		}
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


