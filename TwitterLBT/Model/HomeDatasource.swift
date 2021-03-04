//
//  HomeDatasource.swift
//  TwitterLBTA
//
//  Created by Brian Voong on 12/31/16.
//  Copyright © 2016 Lets Build That App. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    let users: [User] = {
       let brianUser = User(name: "dev.geeyong", username: "@gxxyxxg", bioText: "iphone, ipad, ios programming community. join us to learn Swift, Objctive-C and build IOS apps", profileImage: #imageLiteral(resourceName: "a"))
        let rayUser = User(name: "Ray Bored", username: "@8puff", bioText: "Ray wenderlich is an iphone developer and cpp on topics reated to iphone, sorftware and lich is an iphone developer and cpp on topics reated to iphone, sorftware and galich is an iphone developer and cpp on topics reated to iphone, sorftware and galich is an iphone developer and cpp on topics reated to iphone, sorftware and galich is an iphone developer and cpp on topics reated to iphone, sorftware and gagaming.", profileImage: #imageLiteral(resourceName: "a"))
        return [brianUser,rayUser]
    }()
    
    let tweets: [Tweet] = {
        let brianUser = User(name: "dev.geeyong", username: "@gxxyxxg", bioText: "iphone, ipad, ios programming community. join us to learn Swift, Objctive-C and build IOS apps", profileImage: #imageLiteral(resourceName: "a"))
        let tweet = Tweet(user: brianUser, message: "ne, sorftware and galich is an iphone developer and cpp on topics reated to iphone, sorftware and galich is an iphone developer and cpp on topics reated to iphone, sorftware and galich is an iphone developer")
        let tweet2 = Tweet(user: brianUser, message: "ne, sorftware and galich is an iphone developer and cpp on topics reated to iphone, sorftware and n us to learn Swift, Objctive-C angalich is an iphone developer and cpp on topics reated to iphone, sorftware and galich is an iphone developer")
        return [tweet,tweet2]
    }()
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self,TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1{
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1{
            return tweets.count
        }
        return users.count
    }
    override func numberOfSections() -> Int {
        return 2
    }
    
}
