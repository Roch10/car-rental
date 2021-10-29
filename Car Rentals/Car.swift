//
//  Car.swift
//  Car Rentals
//
//  Created by Roch on 28/10/2021.
//

import Foundation
class Car {
    var name:String
    var dailyRent:Double
    var carImage: [String]
    var carDescription:String
    var mileage:Int
    var carMake:String
    
    init(name:String,dailyRent:Double,carImage: [String],carDescription:String,mileage:Int, carMake:String){
        self.name = name
        self.dailyRent = dailyRent
        self.carImage = carImage
        self.carDescription = carDescription
        self.mileage = mileage
        self.carMake = carMake
    }
}
