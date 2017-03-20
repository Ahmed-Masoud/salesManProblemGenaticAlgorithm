//
//  Route.swift
//  salesManProblemGenatic
//
//  Created by Ahmed masoud on 3/18/17.
//  Copyright © 2017 Amasoud. All rights reserved.
//

import Foundation

public class Route{
    private var myRoute = [City]()
    private var weight: Double = 0
    private var distance = 0
    
    init(route: [City]) {
        myRoute = route
    }
    
    init() {
        let dummyCity = City(x: -1, y: -1)
        var i = 0
        while i < RouteManager.getNumberOfCities() {
            myRoute.append(dummyCity)
            i+=1
        }
    }
    
    public func setCity(city: City, pos: Int){
        myRoute[pos] = city
        weight = 0
        distance = 0
    }
    
    public func getCity(pos: Int)->City {
    return myRoute[pos]
    }
    
    public func generateRoute(){
        var i = 0
        while i < RouteManager.getNumberOfCities() {
            setCity(city: RouteManager.getCity(index: i), pos: i)
            i+=1
        }
        myRoute = myRoute.shuffled()
    }
    
    public func getWeight()->Double{
        if distance == 0 {
            weight = 1/getDistance()
        }
        return weight
    }
    
    public func getDistance()->Double{
        if distance == 0 {
            var routeDistance = 0.0
            var i = 0
            while i < myRoute.count {
                let fromCity: City = getCity(pos: i)
                var destinationCity = getCity(pos: 0)
                if i < myRoute.count - 1 {
                    destinationCity = getCity(pos: i+1)
                }
                routeDistance += fromCity.distanceTo(city: destinationCity)
                i+=1
            }
            distance = Int(routeDistance)
        }
        return Double(distance)
    }
    
    public func numberOfCitiesInRoute()->Int{
        return myRoute.count
    }
    
    public func containsCity(city: City)->Bool{
        if myRoute.contains(where: {(city) -> Bool in return true}){
            return true
        }
        return false
    }
    
    public func printRoute()->String{
        var geneString = "|"
        var i = 0
        while i < myRoute.count {
            geneString += "\(getCity(pos: i)) | "
            i+=1
        }
        return geneString
    }    
}
extension MutableCollection where Indices.Iterator.Element == Index {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled , unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}
extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Iterator.Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
