//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Ruslan on 11/09/2017.
//  Copyright © 2017 Ruslan Petrov. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
        let ruslanUser = User(name: "Ruslan Petrov", username: "@iampetrovruslan", bioText: "Develop iOS apps and write about it. Study at HSE University in Moscow.", profileImage: #imageLiteral(resourceName: "twitterProfileImage"))
        let rayUser = User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "rayProfileImage"))
        let ruslanUser2 = User(name: "Not Ruslan Petrov", username: "@iamnotpetrovruslan", bioText: "TEST TEST TEST", profileImage: #imageLiteral(resourceName: "twitterProfileImage"))
        let rayUser2 = User(name: "Not Ray Wenderlich", username: "@notrwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software and gaming. Check out our conference. And one more sentense. And one more sentense. And one more sentense.", profileImage: #imageLiteral(resourceName: "rayProfileImage"))
        
        return [ruslanUser, rayUser, ruslanUser2, rayUser2]
    }()
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
}
