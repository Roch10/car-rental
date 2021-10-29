//
//  DetailViewController.swift
//  Car Rentals
//
//  Created by Roch on 28/10/2021.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return car.carImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let carImage = car.carImage[indexPath.row]
        let cell = pictureTV.dequeueReusableCell(withIdentifier: "pictures", for: indexPath) as! PicturesViewCell
        cell.setPictureCell(carImage: carImage)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        carImage.image = UIImage(named: car.carImage[indexPath.row])
    }
    

    @IBOutlet weak var carTitle: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carDetail: UITextView!
    @IBOutlet weak var numberOfDays: UILabel!
    @IBOutlet weak var dayPicker: UISlider!
    @IBOutlet weak var dayStepper: UIStepper!
    @IBOutlet weak var successMssg: UILabel!
    
    @IBOutlet weak var pictureTV: UITableView!
    
    var car: Car! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        carTitle.text = "\(car.carMake): \(car.name)"
        carImage.image = UIImage(named: car.carImage[0])
        carDetail.text = car.carDescription
        
        pictureTV.delegate = self
        pictureTV.dataSource = self
    }

    @IBAction func chooseDays(_ sender: Any) {
        numberOfDays.text = String(dayPicker.value)
    }
    
    @IBAction func increaseDays(_ sender: Any) {
        numberOfDays.text = String(format: "%0.0f", dayStepper.value)
    }
    
    @IBAction func rentCar(_ sender: Any) {
        let total = car.dailyRent * Double(numberOfDays.text!)!
        successMssg.text = "Your total is $\(String(format: "%0.2f", total))"
    }
    
}
