//
//  APIClient.swift
//  Movie App Take 2
//
//  Created by Raquel Rahmey on 3/10/17.
//  Copyright © 2017 Raquel Rahmey. All rights reserved.
//

import Foundation
import UIKit

class APIClient {
    
    static let baseURLSearchString: String = "https://www.omdbapi.com/?apikey=\(Secrets.apiKey)&s="
    static let baseURLMovieString: String = "https://www.omdbapi.com/?apikey=\(Secrets.apiKey)&i="
    
    class func search(query: String, completion: @escaping ([Movie]) -> Void )  {
        let validSearch = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "No Good"
        let urlString = "\(baseURLSearchString)\(validSearch)"
        let url = URL(string: urlString)
        let session = URLSession.shared
        
        guard let unwrappedURL = url else { fatalError("Invalid URL \(url)") }
        
        let urlRequest = URLRequest(url: unwrappedURL)
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else { fatalError("Unable to get data \(error?.localizedDescription)") }
            if let responseArray = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                guard let results = responseArray?["Search"] as? [Any] else { print("couldn't get results"); return }
                var moviesToReturn = [Movie]()
                results.forEach({ (movie) in
                    let newMovie = Movie(dict: movie as? [String : Any] ?? [:])
                    moviesToReturn.append(newMovie)
                })
                completion(moviesToReturn)
            }
            
        }
        task.resume()
        
    }
    
    class func imdbDetail(id: String, completion: @escaping (MovieDetail) -> Void ) {
        let urlString = "\(baseURLMovieString)\(id)"
        let url = URL(string: urlString)
        let session = URLSession.shared
        
        guard let unwrappedURL = url else { fatalError("Invalid URL \(url)") }
        
        let urlRequest = URLRequest(url: unwrappedURL)
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else { fatalError("Unable to get data \(error?.localizedDescription)") }
            if let response = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                if let response = response {
                    let newMovieDetail = MovieDetail(dict: response as? [String:Any] ?? [:])
                    completion(newMovieDetail)
                }
            }
            
        }
        task.resume()
    }
    
    
    class func loadImageFromUrl(url: String, completion: @escaping (UIImage) -> Void) {
        
        let url = NSURL(string: url)!
        let task = URLSession.shared.dataTask(with: url as URL) { (responseData, responseUrl, error) -> Void in
            if let data = responseData{
                DispatchQueue.main.async {
                    guard let image = UIImage(data: data) else { print("couldn't get image from data"); return }
                    completion(image)
                }
            }
        }
        task.resume()
    }
    
    
}
