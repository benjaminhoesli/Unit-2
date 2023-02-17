//
//  DetailViewController.swift
//  Unit 2
//
//  Created by Benjamin Hoesli on 11.02.23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var movieRating: UILabel!
    var movie: Movie!

    @IBOutlet weak var movieVotes: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var moviePopularity: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Load the image located at the `artworkUrl100` URL and set it on the image view.
       Nuke.loadImage(with: movie.artworkUrl100, into: movieImageView)

        //Set labels with the associated track values.

        movieRating.text=movie.movieRating
        movieVotes.text=movie.movieVotes
        movieDescription.text=movie.movieDescription
        movieNameLabel.text=movie.movieName
        moviePopularity.text=movie.moviePopularity
        
    
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }

}
