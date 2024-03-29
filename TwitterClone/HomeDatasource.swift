//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Ruslan on 11/09/2017.
//  Copyright © 2017 Ruslan Petrov. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

extension Collection where Iterator.Element == JSON {
    func decode<T: JSONDecodable>() throws -> [T] {
        return try map { try T(json: $0) }
    }
}

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    let tweets: [Tweet]

    required init(json: JSON) throws {
        guard let usersJSONArray = json["users"].array,
            let tweetsJSONArray = json["tweets"].array else {
            throw NSError(domain: "edu.hse.rapetrov.TwitterClone", code: 1, userInfo: [NSLocalizedDescriptionKey: "parsing JSON was not valid"])
        }
        
        self.users = try usersJSONArray.decode()
        self.tweets = try tweetsJSONArray.decode()
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
}
