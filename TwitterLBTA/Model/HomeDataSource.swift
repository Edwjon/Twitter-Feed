//
//  HomeDataSource.swift
//  Twitter
//
//  Created by Edward Pizzurro Fortun on 7/12/17.
//  Copyright © 2017 Pencil. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    
    let users: [User] = {
        let brianUser = User(name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image"))
            
        let rayUser = User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
            
        let kindleCourseUser = User(name: "Kindle Course", username: "@kindleCourse", bioText: "This recently released course on https://videos.letsbuildthatapp.com/basic-training provides some excellent guidance on how to use UITableView and UICollectionView.  This course also teaches some basics on the Swift language, for example If Statements and For Loops.  This will be an excellent purchase for you.", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        return [brianUser, rayUser, kindleCourseUser]
    }()
    
    let tweets: [Tweet] = {
        
        let brianUser = User(name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        let tweet = Tweet(user:brianUser, message: "WblababalbalblablablablablalalaWblababalbalblablablablablalalaWblababalbalblablablablablalalaWblababalbalblablablablablalalaWblababalbalblablablablablalalaWblababalbalblablablablablalalaWblababalbalblablablablablalala")
        let tweet2 = Tweet(user:brianUser, message: "WblababalbalblablablablablalalaWblababalbalblablablablablalalaWblababalbalblablablablablalalaWblababalbalblablablablablalalaWblababalbalblablablablablalala")
        
        return [tweet, tweet2]
    }()
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
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

/*required init(json: JSON) throws {
 var users = [User]()
 
 let array = json["users"].array
 for userJson in array! {
 let name = userJson["name"].stringValue
 let username = userJson["username"].stringValue
 let bio = userJson["bio"].stringValue
 
 let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
 users.append(user)
 }
 
 self.users = users
 }*/

//ESTO SE PONE CUANDO SE USA JSON



