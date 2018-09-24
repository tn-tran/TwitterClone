//
//  UserCell.swift
//  TwitterClone
//
//  Created by Tien Tran on 9/23/18.
//  Copyright © 2018 Tien-Enterprise. All rights reserved.
//

import Foundation
import LBTAComponents

class UserCell: DatasourceCell {
	override var datasourceItem: Any? {
		didSet {
			
			guard let user = datasourceItem as? User else { return }
			nameLabel.text = user.name
			usernameLabel.text = user.username
			bioTextView.text = user.bioText
			profileImageView.image = user.profileImage
		}
	}
	
	let profileImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "profile_image")
		imageView.layer.cornerRadius = 5
		imageView.layer.borderWidth = 1
		imageView.layer.borderColor = UIColor.black.cgColor
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.text = "Tien Tran"
		label.font = UIFont.boldSystemFont(ofSize: 16)
		return label
	}()
	let usernameLabel: UILabel = {
		let label = UILabel()
		label.text = "@tieen-tran"
		label.font = UIFont.systemFont(ofSize: 14)
		label.textColor = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
		return label
	}()
	
	let bioTextView: UITextView = {
		let textView = UITextView()
		textView.text = "My bio feed"
		textView.font = UIFont.systemFont(ofSize: 15)
		textView.backgroundColor = .clear
		
		return textView
	}()
	
	let followButton: UIButton = {
		let button = UIButton()
		button.layer.cornerRadius = 5
		button.layer.borderColor = twitterBlue.cgColor
		button.layer.borderWidth = 1
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
		button.setTitle("Follow", for: .normal)
		button.setImage(UIImage(named: "add_person"), for: .normal)
		button.imageView?.contentMode = .scaleAspectFit
		button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
		// button.titleEdgeInsets = UIEdgeInsets
		button.setTitleColor(twitterBlue, for: .normal)
		return button
	}()
	
	
	override func setupViews() {
		super.setupViews()
		
		separatorLineView.isHidden = false
		separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
		
		addSubview(profileImageView)
		addSubview(nameLabel)
		addSubview(usernameLabel)
		addSubview(bioTextView)
		addSubview(followButton)
		
		
		profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
		
		nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
		
		usernameLabel.anchor(nameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
		
		bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
		
		followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
	}
}
