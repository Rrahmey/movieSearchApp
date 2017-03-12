//
//  APIClientDataStore.swift
//  Movie App Take 2
//
//  Created by Raquel Rahmey on 3/10/17.
//  Copyright © 2017 Raquel Rahmey. All rights reserved.
//

import Foundation


final class DataStore {
    static let sharedInstance = DataStore()
    
    var movies = [Movie]()
    private init() {}

}
