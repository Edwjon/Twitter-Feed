//
//  HomeDataSourceController.swift
//  Twitter
//
//  Created by Edward Pizzurro Fortun on 7/12/17.
//  Copyright © 2017 Pencil. All rights reserved.
//

import LBTAComponents


class HomeDataSourceController: DatasourceController {
    
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        collectionViewLayout.invalidateLayout()
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(r:232, g:236, b: 241)
        
        setupNavigationBarItems()
        
        
        let homeDataSource = HomeDataSource()
        self.datasource = homeDataSource
        
    }
    
    
    //eliminar el gap entre las celdas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let user = self.datasource?.item(indexPath) as? User {
            
            let aproximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: aproximateWidthOfBioTextView, height: 1000)
            let attributes = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15)]
            
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 1 {
            return .zero
        }
        
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 1 {
            return .zero
        }
        
        return CGSize(width: view.frame.width, height: 64)
    }
    
}


/*let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
 
 class Home: JSONDecodable {
 
 let users: [User]
 
 required init(json: JSON) throws {
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
 }
 
 }
 
 class JSONError: JSONDecodable {
 required init(json: JSON) throws {
 print("JSON ERROR")
 }
 }
 
 fileprivate func fetchHomeFeed() {
 //start our json fetch
 
 let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
 
 request.perform(withSuccess: { (homeDatasource) in
 print("Successfully fetched our json objects")
 
 print(homeDatasource.users.count)
 
 self.datasource = homeDatasource
 
 }) { (err) in
 print("Failed to fetch json...", err)
 }
 
 }*/

// ESTO SE PONE CUANDO SE USA JSON





