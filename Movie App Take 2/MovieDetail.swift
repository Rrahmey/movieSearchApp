//
//  MovieDetail.swift
//  Movie App Take 2
//
//  Created by Benjamin Bernstein on 3/13/17.
//  Copyright © 2017 Raquel Rahmey. All rights reserved.
//

import Foundation

class MovieDetail {
    
    var title: String
    var year: String
    var rated: String
    var runtime: String
    var genre: String
    var director: String
    var writer: String
    var actors: String
    var plot: String
    var language: String
    var country: String
    var awards: String
    var metascore: String
    var imdbRating: String
    
    
    init(dict: [String:Any]) {
        self.title = dict["Title"] as? String ?? "No Title"
        self.year = dict["Year"] as? String ?? "No Year"
        self.rated = dict["Rated"] as? String ?? "No rating"
        self.runtime = dict["Runtime"] as? String ?? "No runtime"
        self.genre = dict["Genre"] as? String ?? "No genre"
        self.director = dict["Director"] as? String ?? "No director"
        self.writer = dict["Writer"] as? String ?? "No writer"
        self.actors = dict["Actors"] as? String ?? "No actors"
        self.plot = dict["Plot"] as? String ?? "No plot"
        self.language = dict["Language"] as? String ?? "No language"
        self.country = dict["Country"] as? String ?? "No country"
        self.awards = dict["Awards"] as? String ?? "No awards"
        self.metascore = dict["Metascore"] as? String ?? "No metascore"
        self.imdbRating = dict["imdbRating"] as? String ?? "No imdbRating"
        
    }
    
    
}
