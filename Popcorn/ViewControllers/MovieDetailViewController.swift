//
//  MovieDetailViewController.swift
//  Popcorn
//
//  Created by Ömer Firat on 28.11.2020.
//  Copyright © 2020 Omer Firat. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var twOverView: UITextView!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var imgMovie: UIImageView!
    var geleniD: Int = 0
    var response: MovieDetailModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       RequestFile.init().getMovieDetail(id: geleniD) { (movieDetailResponse) in
        self.response = movieDetailResponse
        self.lblMovieName.text = self.response?.title
        self.twOverView.text = self.response?.overview
        let imgMovies = self.response?.posterPath ?? ""
               let url = URL(string: "https://image.tmdb.org/t/p/original" + imgMovies)
        self.imgMovie.kf.setImage(with: url)

               }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
