//
//  FoodTableViewCell.swift
//  HealthyLife
//
//  Created by admin on 7/27/16.
//  Copyright © 2016 NguyenBui. All rights reserved.
//

import UIKit
import Firebase

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
    
   
    @IBOutlet weak var desLabel: UILabel!
    
    let storageRef = FIRStorage.storage().reference()


    
    func configureCell(food : Food) {
        
        
        desLabel.text = food.foodDes
        
        
        let islandRef = storageRef.child("images/\(food.foodKey)")
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        islandRef.dataWithMaxSize((1 * 1024 * 1024)/2) { (data, error) -> Void in
            if (error != nil) {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                print("it workss")
                let foodImage: UIImage! = UIImage(data: data!)
                self.foodImageView.image = foodImage
                
                
                
            }
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
