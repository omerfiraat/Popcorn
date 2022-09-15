//
//  ViewController.swift
//  Popcorn
//
//  Created by Ömer Firat on 26.11.2020.
//  Copyright © 2020 Omer Firat. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import Lottie
import FSPagerView


class ViewController: UIViewController {
    
    @IBOutlet weak var pagerView: FSPagerView!{
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.itemSize = FSPagerView.automaticSize
        }
    }
    
    @IBOutlet weak var tbvMovieCell: UITableView!
    var movieModel: MovieModel?
    var selectediD: Int?
    
    @IBOutlet weak var lblPagerRating: UILabel!
    @IBOutlet weak var lblPagerName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        RequestFile.init().getMovieList{ (movieModel) in
            self.movieModel = movieModel
            self.tbvMovieCell.reloadData()
            self.pagerView.reloadData()
            
            
        }
        pagerView.delegate = self
        pagerView.dataSource = self
        // self.view.addSubview(pagerView)
        // Create a page control
        pagerView.transformer = FSPagerViewTransformer(type: .crossFading)
        
        
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell") as! MovieListCell
        let deneme = self.movieModel?.results[indexPath.row].posterPath ?? ""
        let url = URL(string: "https://image.tmdb.org/t/p/original" + deneme)
        cell.imgMovie.kf.setImage(with: url)
        
        cell.lblMovieName.text = self.movieModel?.results[indexPath.row].title
        cell.lblDate.text = self.movieModel?.results[indexPath.row].releaseDate
        cell.lblPuan.text = "\(self.movieModel?.results[indexPath.row].voteAverage ?? 0.0)"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.movieModel?.results.count ?? 0
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectediD = self.movieModel?.results[indexPath.row].id
        performSegue(withIdentifier: "goMovieDetail", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goMovieDetail"{
            let destinationVC = segue.destination as! MovieDetailViewController
            destinationVC.geleniD = selectediD ?? 0
        }
    }
    
}

extension ViewController: FSPagerViewDelegate, FSPagerViewDataSource{
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.movieModel?.results.count ?? 0
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        lblPagerName.text = self.movieModel?.results[index].title
        lblPagerRating.text = "\(self.movieModel?.results[index].voteAverage ?? 0)"
        let deneme = self.movieModel?.results[index].posterPath ?? ""
        let url = URL(string: "https://image.tmdb.org/t/p/original" + deneme)
        cell.imageView?.kf.setImage(with: url)

        
        return cell
    }
    
}


