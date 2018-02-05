//
//  PhotosViewController.swift
//  flix_Project1Lab
//
//  Created by Jasmine Edwards on 2/4/18.
//  Copyright © 2018 Jasmine Edwards. All rights reserved.
//

import Foundation
import UIKit



class PhotosViewController: UIViewController,
    UITableViewDataSource,
    UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.textLabel?.text = "This is row \(indexPath.row)"
        
        return cell
    }
    
    
    
    
  var posts: [[String: Any]] = []
    
    
    
            
            override func viewDidLoad()
            {
                super.viewDidLoad()
                
                
                
                // Network request snippet
                let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
                let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
                session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
                let task = session.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else if let data = data,
                        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print(dataDictionary)
                        
                       let responseDictionary = dataDictionary["response"] as! [String: Any]
                        
                        self.posts = responseDictionary["posts"] as! [[String: Any]]

                        
                        // TODO: Reload the table view
                    }
                }
                task.resume()
                
                
                
            }
          
    // Get the dictionary from the response key
    let responseDictionary = dataDictionary["response"] as! [String: Any]
    // Store the returned array of dictionaries in our posts property
    self.posts = responseDictionary["posts"] as! [[String: Any]]
            

}



