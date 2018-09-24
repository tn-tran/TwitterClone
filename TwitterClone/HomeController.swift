//
//  HomeController.swift
//  TwitterClone
//
//  Created by Tien Tran on 9/22/18.
//  Copyright © 2018 Tien-Enterprise. All rights reserved.
//

import Foundation
import UIKit

class WordCell: UICollectionViewCell {
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
		
	}
	
	let wordLabel: UILabel = {
		let label = UILabel()
		label.text = "Testing"
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	
	func setupViews() {
		backgroundColor = .yellow
		addSubview(wordLabel)
		wordLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		wordLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
		wordLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
		wordLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
		
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	let cellID = "cellID"
	let headerID = "headerID"
	let footerID = "footerID"
	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView?.backgroundColor = .white
		collectionView?.register(WordCell.self, forCellWithReuseIdentifier: cellID)
		collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
		collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerID)
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 4
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
		
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: view.frame.width, height: 50)
	}
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		
		
		if kind == UICollectionView.elementKindSectionHeader {
			let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath)
			header.backgroundColor = .blue
			return header
		} else {
			let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath)
			footer.backgroundColor = .green
			return footer
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: view.frame.width, height: 50)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
		return CGSize(width: view.frame.width, height: 100)
	}
}
