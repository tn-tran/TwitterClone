//
//  Service.swift
//  TwitterClone
//
//  Created by Tien Tran on 9/25/18.
//  Copyright © 2018 Tien-Enterprise. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
	
	let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
	static let sharedInstance = Service()
	
	func fetchHomeFeed(completion: @escaping (HomeDatasource?, Error?) -> ()) {
		print("fetching home feed")
		
		let request: APIRequest<HomeDatasource, JSONError> = tron.swiftyJSON.request("/twitter/home")
		request.perform(withSuccess: { (homeDataSource) in
			print("Successfully fetched our json object")
			completion(homeDataSource, nil)
		}) { (error) in
			

			completion(nil, error)
			
			
		}
	}
	
	class JSONError: JSONDecodable {
		required init(json: JSON) throws {
			print("JSON ERROR:")
		}
	}
	
}
