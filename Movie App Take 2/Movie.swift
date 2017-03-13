//
//  Movie.swift
//  Movie App Take 2
//
//  Created by Raquel Rahmey on 3/10/17.
//  Copyright © 2017 Raquel Rahmey. All rights reserved.
//

import Foundation

class Movie {
    
    var posterURL: String
    var title: String
    var year: String
    var imdbID:String
    
   
    
    init(dict: [String:Any]) {
        self.posterURL = dict["Poster"] as? String ?? "No Poster URL"
        self.title = dict["Title"] as? String ?? "No Title"
        self.year = dict["Year"] as? String ?? "No Year"
        self.imdbID = dict["imdbID"] as? String ?? "No imdbID"
        
    }
    
    
}
