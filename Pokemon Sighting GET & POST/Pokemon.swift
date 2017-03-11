//
//  Pokemon.swift
//  Pokemon Sighting GET & POST
//
//  Created by Sreekala Santhakumari on 3/7/17.
//  Copyright © 2017 Klas. All rights reserved.
//

import UIKit

class Pokemon {
    
    //var id : Int
    var name  : String
    var imageURL : String
    var latitude :  Float!
    var longitude : Float!
    
//    init(name :String, imageURL :String) {
//        self.name = name
//        self.imageURL = imageURL
//    }
    
    init(/*id : Int,*/ name : String, imageURL : String , latitude : Float, longitude : Float) {
        //self.id = id
        self.name = name
        self.imageURL = imageURL
        self.latitude = latitude
        self.longitude = longitude
        
    }

}
