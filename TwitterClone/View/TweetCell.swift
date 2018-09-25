//
//  TweetCell.swift
//  TwitterClone
//
//  Created by Tien Tran on 9/24/18.
//  Copyright © 2018 Tien-Enterprise. All rights reserved.
//

import Foundation
import LBTAComponents
class TweetCell: DatasourceCell {
	
	let profileImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "profile_image")
		imageView.layer.cornerRadius = 5
		imageView.layer.borderWidth = 1
		imageView.layer.borderColor = UIColor.black.cgColor
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	override func setupViews() {
		super.setupViews()
		separatorLineView.isHidden = false
		separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
		backgroundColor = .white
		addSubview(profileImageView)
		profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
		
		
	}
	
	
}

