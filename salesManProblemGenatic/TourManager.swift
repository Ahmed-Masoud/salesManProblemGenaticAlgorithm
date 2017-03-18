//
//  TourManager.swift
//  salesManProblemGenatic
//
//  Created by Ahmed masoud on 3/18/17.
//  Copyright © 2017 Amasoud. All rights reserved.
//

import Foundation

class TourManager{
    private static var destinationCities = [City]()
    
    public static func addCity(city: City){
        self.destinationCities.append(city)
    }
    
    public static func getCity(index: Int)->City{
        return self.destinationCities[index]
    }
    
    public static func getNumberOfCities()->Int{
        return self.destinationCities.count
    }
}
