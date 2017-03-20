//
//  Population.swift
//  salesManProblemGenatic
//
//  Created by Ahmed masoud on 3/18/17.
//  Copyright © 2017 Amasoud. All rights reserved.
//

import Foundation

public class Population {
    
    var routes = [Route]()
    
    init(count: Int, initializ: Bool) {
        if initializ {
            var i = 0
            while i < count {
                let newRoute = Route()
                newRoute.generateRoute()
                routes.append(newRoute)
                i+=1
            }
        }
    }
    
    public func getRoute(index: Int)->Route{
        return routes[index]
    }
    
    public func getBestRoute()->Route{
        var fittest = routes[0]
        // Loop through individuals to find fittest
        var i = 0
        while i < populationSize() {
            if fittest.getWeight() <= getRoute(index: i).getWeight() {
                fittest = getRoute(index: i)
            }
            i+=1
        }
        return fittest
    }
    
    
    public func populationSize()->Int{
        return routes.count
    }

}
