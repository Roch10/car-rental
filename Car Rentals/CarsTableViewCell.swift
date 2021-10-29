//
//  CarsTableViewCell.swift
//  Car Rentals
//
//  Created by Roch on 28/10/2021.
//

import UIKit

class CarsTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var dailyRents: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCarCell(obj:Car){
        name.text = obj.name
        dailyRents.text = String(obj.dailyRent)
        thumbnail.image = UIImage(named: obj.carImage[0])
    }

}
