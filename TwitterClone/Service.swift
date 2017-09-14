//
//  Service.swift
//  TwitterClone
//
//  Created by Ruslan on 14/09/2017.
//  Copyright © 2017 Ruslan Petrov. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource) -> ()) {
//        print("Fetching home feed")
        
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDatasource) in
//            print("Successfully fetched our json objects")
            
            completion(homeDatasource)
        }) { (err) in
            print("Failed to fetch json", err)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON Error")
        }
    }
}
