///Users/Ben/Downloads/swift-movie-app-take-2/Movie App Take 2.xcodeproj
//  FirstViewController.swift
//  Movie App Take 2
//
//  Created by Raquel Rahmey on 3/10/17.
//  Copyright © 2017 Raquel Rahmey. All rights reserved.
//

import UIKit

class MovieSearchViewController: UICollectionViewController {
    
    var moviesArray = DataStore.sharedInstance.movies
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieItem", for: indexPath) as! MovieCollectionViewCell
        APIClient.loadImageFromUrl(url: moviesArray[indexPath.row].posterURL, completion: { (image) in
            cell.imageView.image = image
        })
        
        return cell
        
    }
    
}

extension MovieSearchViewController {
    @IBAction func movieSearch(_ sender: Any) {
        let alert = UIAlertController(title: "Search", message: "Enter Movie Search", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Search"
        }
        
        let searchAction = UIAlertAction(title: "Search", style: .default) { (UIAlert) in
            guard let answer = alert.textFields?[0] else { return }
            guard let answerText = answer.text else { return }
            APIClient.search(query: answerText, completion: { (movies) in
                DispatchQueue.main.async {
                    self.moviesArray.removeAll()
                    self.moviesArray.append(contentsOf: movies)
                    self.collectionView?.reloadData()
                }
                
            })
        }
        alert.addAction(searchAction)
        present(alert, animated: true, completion: nil)
    }
}



