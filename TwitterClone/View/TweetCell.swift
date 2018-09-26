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
	
	override var datasourceItem: Any? {
		didSet {
			guard let tweet = datasourceItem as? Tweet else {  return }
			
			profileImageView.loadImage(urlString: tweet.user.profileImageUrl)
			
			
			let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedString.Key.font :  UIFont.boldSystemFont(ofSize: 15)])
			let usernameString = " \(tweet.user.username)\n"
			
			attributedText.append(NSAttributedString(string: usernameString, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.gray]))
			
			// adds a paragraph next to message to space it down
			let paragraphStyle = NSMutableParagraphStyle()
			paragraphStyle.lineSpacing = 10
			let range = NSRange(location: 0, length: attributedText.string.count)
			attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
			
			attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]))
			
			messageTextView.attributedText = attributedText

		}
	}
	let messageTextView: UITextView = {
		
		let tv = UITextView()
		tv.text = "Some sample text"
		tv.backgroundColor = .clear
		
		return tv
		
	}()
	
	let profileImageView: CachedImageView = {
		let imageView = CachedImageView()
		imageView.image = UIImage(named: "profile_image")
		imageView.layer.cornerRadius = 5
		imageView.layer.borderWidth = 1
		imageView.layer.borderColor = UIColor.black.cgColor
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	
	let replyButton: UIButton = {
		let button = UIButton(type: .system)
		button.setImage(UIImage(named: "reply")?.withRenderingMode(.alwaysOriginal), for: .normal)
		return button
	}()
	
	let retweetButton: UIButton = {
		let button = UIButton(type: .system)
		button.setImage(UIImage(named: "retweet")?.withRenderingMode(.alwaysOriginal), for: .normal)
		return button
	}()
	
	
	let likeButton: UIButton = {
		let button = UIButton(type: .system)
		button.setImage(UIImage(named: "like")?.withRenderingMode(.alwaysOriginal), for: .normal)
		return button
	}()
	
	
	let directMessageButton: UIButton = {
		let button = UIButton(type: .system)
		button.setImage(UIImage(named: "send_message")?.withRenderingMode(.alwaysOriginal), for: .normal)
		return button
	}()
	
	
	
	override func setupViews() {
		super.setupViews()
		separatorLineView.isHidden = false
		separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
		backgroundColor = .white
		addSubview(profileImageView)
		addSubview(messageTextView)
//		addSubview(replyButton)
//		addSubview(retweetButton)
		profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
		
		messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
		
//		replyButton.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
		
		setupBottomButtons()
	}
	
	fileprivate func setupBottomButtons() {
		let replyButtonContainerView = UIView()
		
		
		let retweetButtonContainerView = UIView()
		
		
		let likeButtonContainerView = UIView()
		
		
		let directMessageButtonContainerView = UIView()
		
		
		let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, directMessageButtonContainerView])
		buttonStackView.axis = .horizontal
		buttonStackView.distribution = .fillEqually
		
		
		addSubview(buttonStackView)
		addSubview(replyButton)
		addSubview(retweetButton)
		addSubview(likeButton)
		addSubview(directMessageButton)
		buttonStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 2, rightConstant: 0, widthConstant: 0, heightConstant: 20)
		
		replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
		
		retweetButton.anchor(retweetButtonContainerView.topAnchor, left: retweetButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
		
		likeButton.anchor(likeButtonContainerView.topAnchor, left: likeButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
		
		directMessageButton.anchor(directMessageButtonContainerView.topAnchor, left: directMessageButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
	}
	
}

