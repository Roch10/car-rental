//
//  ViewController.swift
//  Car Rentals
//
//  Created by Roch on 28/10/2021.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempCarList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = tempCarList[indexPath.row]
        let cell = CarTV.dequeueReusableCell(withIdentifier: "cars", for: indexPath) as! CarsTableViewCell
        cell.setCarCell(obj: obj)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mileage.text = String(tempCarList[indexPath.row].mileage)
        car = tempCarList[indexPath.row]
        alertMssg.text = ""
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return carMakeList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return carMakeList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        car = nil
        alertMssg.text = ""
        tempCarList.removeAll()
        for car in carList {
            if car.carMake == carMakeList[row] {
                tempCarList.append(car)
            }
        }
        CarTV.reloadData()
    }
    
    var carMakeList = ["Toyota", "Nissan", "Ford","Tesla"]
    var carList = [Car]()
    var tempCarList = [Car]()
    var car: Car! = nil
    @IBOutlet weak var CarMakersPV: UIPickerView!
    @IBOutlet weak var CarTV: UITableView!
    @IBOutlet weak var mileage: UILabel!
    @IBOutlet weak var alertMssg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
        
        CarMakersPV.dataSource = self
        CarMakersPV.delegate = self
        
        CarTV.dataSource = self
        CarTV.delegate = self
        
        for car in carList {
            if car.carMake == carMakeList[0] {
                tempCarList.append(car)
            }
        }
        CarTV.reloadData()
    }
    
    func loadData(){
        carList.append(Car(name: "Toyota 4Runner", dailyRent: 45.3, carImage: ["Toyota4Runner","Toyota4Runner2","Toyota4Runner3","Toyota4Runner4"], carDescription: "The Toyota 4Runner mid-size SUV seamlessly blends rugged 4x4 capability with a refined interior. Ready and waiting to power your next adventure.", mileage: 14, carMake: carMakeList[0]))
        carList.append(Car(name: "Toyota Corolla", dailyRent: 35.5, carImage: ["ToyotaCorolla","ToyotaCorolla2","ToyotaCorolla3"] ,carDescription: "The 2022 Toyota Corolla is here. Choose from the refined L, the sporty SE, the dynamic Corolla hybrid, or head-turning option packages like the sporty Apex or dramatic Nightshade Edition. Fun. Smart. Value-packed. Get more out of life behind the wheel of a Corolla.", mileage: 10, carMake: carMakeList[0]))
        carList.append(Car(name: "Toyota RAV4", dailyRent: 55.12, carImage: ["ToyotaRAV4"], carDescription: "Take the wheel of the Envision and you can take Alexa along for the ride. The voice-activated convenience of available Amazon Alexa Built-In† plus other experience-enhancing technologies like wireless compatibility for Apple CarPlay®† and Android AutoTM† are as useful as they are impressive. Imagine what it means to drive an SUV that’s so cleverly an extension of you.", mileage: 20, carMake: carMakeList[0]))
        carList.append(Car(name: "Nissan Qashqai", dailyRent: 38.2, carImage: ["NissanQashqai"], carDescription: "Take on each day with standard Safety Shield® 360 and other driver assist features that help make your drive more confident while helping to keep a look out.", mileage: 55, carMake: carMakeList[1]))
        carList.append(Car(name: "Nissan Sentra", dailyRent: 38.2, carImage: ["NissanSentra","NissanSentra2"], carDescription: "Low and wide, with ideal proportions that perfectly complement the premium interior seating and design.", mileage: 35, carMake: carMakeList[1]))
        carList.append(Car(name: "Ford Mustang", dailyRent: 15.3, carImage: ["FordMustang", "FordMustang2"], carDescription: "Hear the roar of a Mustang as the ground starts to tremble and your legs start to shake. As always, Mustang calls upon its performance roots with features for handling, high-powered available engine options and a classic Mustang design", mileage: 34, carMake: carMakeList[2]))
        carList.append(Car(name: "Tesla Model 3", dailyRent: 24.2, carImage: ["TeslaModel3","TeslaModel32","TeslaModel33","TeslaModel34"], carDescription: "Spend hours or days looking at cars without knowing what type of financing you can get approved for.", mileage: 23, carMake: carMakeList[3]))
        carList.append(Car(name: "Tesla Model Y", dailyRent: 65.34, carImage: ["TeslaModelY","TeslaModelY2"], carDescription: "This is the spark. The dawn of a bright new era. Our electric future, rooted in more than a century of innovation, begins with an uncompromising electric SUV. Meet the Cadillac LYRIQ Debut Edition.", mileage: 45, carMake: carMakeList[3]))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as? DetailViewController
        detailVC!.car = self.car
    }

    @IBAction func showMore(_ sender: Any) {
        alertMssg.text = ""
        if car != nil {
            performSegue(withIdentifier: "details", sender: self)
        } else {
            alertMssg.text = "Please select a car."
        }
    }
    
}

