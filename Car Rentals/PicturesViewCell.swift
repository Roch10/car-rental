//
//  PicturesViewCell.swift
//  Car Rentals
//
//  Created by Roch on 28/10/2021.
//

import UIKit

class PicturesViewCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPictureCell(carImage:String){
        picture.image = UIImage(named: carImage)
    }

}
