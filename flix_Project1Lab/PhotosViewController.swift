//
//  PhotosViewController.swift
//  flix_Project1Lab
//
//  Created by Jasmine Edwards on 2/4/18.
//  Copyright © 2018 Jasmine Edwards. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage



class PhotosViewController: UIViewController,
    UITableViewDataSource,
    UITableViewDelegate
{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var image: UIImage!
    var posts: [[String: Any]] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        let post = posts[indexPath.row]
        let photos = post["photos"] as! [[String: Any]]
        let photo = photos[0]
        let originalSize = photo["original_size"] as! [String: Any]
        let urlString = originalSize["url"] as! String
        print(urlString + "\n")
        let url = URL(string: urlString)
        cell.tumblrImage.af_setImage(withURL: url!)
        
        return cell
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        let vc = segue.destination as! PhotoDetailsViewController
        
        let cell = sender as! UITableViewCell
        
        let indexPath = tableView.indexPath(for: cell)!
        //same as the code above
        let post = posts[indexPath.row]
        let photos = post["photos"] as! [[String: Any]]
        let photo = photos[0]
        let originalSize = photo["original_size"] as! [String: Any]
        let urlString = originalSize["url"] as! String
        print(urlString + "\n")
        let url = URL(string: urlString)
        vc.imageURL = url!
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        
        tableView.rowHeight = 250
        
        tableView.dataSource = self
        
        // Network request snippet
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                
                self.posts = responseDictionary["posts"] as! [[String: Any]]
                
                
                self.tableView.reloadData()
            }
        }
        task.resume()
        
        
    }
    
    
    
}




