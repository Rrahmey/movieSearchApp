//
//  MovieDetailViewController.swift
//  Movie App Take 2
//
//  Created by Benjamin Bernstein on 3/13/17.
//  Copyright © 2017 Raquel Rahmey. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var moviePlot: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    
    var posterImage: UIImage?
    var movieDetail: MovieDetail?
    var imdbID: String?
    
    override func viewDidLoad() {
        guard let imdbID = imdbID else {return}
        APIClient.imdbDetail(id: imdbID, completion: { (movieDetail) in
            self.movieDetail = movieDetail
            self.movieTitle.text = movieDetail.title
            self.movieGenre.text = movieDetail.genre
            self.moviePlot.text = movieDetail.plot
        })
        moviePosterImage.image = posterImage
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
}
