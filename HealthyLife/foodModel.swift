//
//  foodModel.swift
//  HealthyLife
//
//  Created by admin on 7/27/16.
//  Copyright © 2016 NguyenBui. All rights reserved.
//

import Foundation
import Firebase

class Food {
    private var FoodRef: FIRDatabaseReference!
    
    private var FoodKey: String!
    private var FoodDes: String!
    private var Angry: Int!
    private var Love: Int!
    
    var foodKey: String {
        return FoodKey
    }
    
    var foodDes: String {
        return FoodDes
    }
    
    var angry: Int {
        return Angry
    }
    
    var love: Int {
        return Love
    }
    
    
   
    
    // Initialize the new Joke
    
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self.FoodKey = key
        
        // Within the Joke, or Key, the following properties are children
        if let ang = dictionary["Angry"] as? Int {
            self.Angry = ang
        }
        
        if let des = dictionary["Description"] as? String {
            self.FoodDes = des
        }
        
        if let lo = dictionary["Love"] as? Int {
            self.Love = lo
        }
   
        
        // The above properties are assigned to their key.
        
        self.FoodRef = FIRDatabase.database().reference().child("users").child((FIRAuth.auth()?.currentUser?.uid)!).child("food_journal").child(self.FoodKey)
    }
    
//    func addSubtractVote(addVote: Bool) {
//        
//        if addVote {
//            PostVotes = PostVotes + 1
//        } else {
//            PostVotes = PostVotes - 1
//        }
//        
//        // Save the new vote total.
//        
//        _jokeRef.childByAppendingPath("votes").setValue(PostVotes)
//        
//    }
//    
//    func addCommentCount(addVote: Bool) {
//        
//        if addVote {
//            CommentNumb = CommentNumb + 1
//        }
//        
//        // Save the new vote total.
//        
//        _jokeRef.childByAppendingPath("commentNumb").setValue(CommentNumb)
//        
//    }
    
    
    
}