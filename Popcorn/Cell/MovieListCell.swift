//
//  MovieListCell.swift
//  Popcorn
//
//  Created by Ömer Firat on 26.11.2020.
//  Copyright © 2020 Omer Firat. All rights reserved.
//

import UIKit

class MovieListCell: UITableViewCell {

    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblPuan: UILabel!
    @IBOutlet weak var lblMovieType: UILabel!
    @IBOutlet weak var lblMovieName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
