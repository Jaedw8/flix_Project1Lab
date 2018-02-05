//
//  PhotoCell.swift
//  flix_Project1Lab
//
//  Created by Jasmine Edwards on 2/4/18.
//  Copyright © 2018 Jasmine Edwards. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    
    @IBOutlet weak var tumblrImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
