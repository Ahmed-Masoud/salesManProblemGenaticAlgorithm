//
//  city.swift
//  salesManProblemGenatic
//
//  Created by Ahmed masoud on 3/18/17.
//  Copyright © 2017 Amasoud. All rights reserved.
//

import Foundation

class City {
    private var _x: Int
    private var _y: Int
    
    init(x: Int, y: Int) {
        self._x = x
        self._y = y
    }
    
    public var x: Int{
        get{
            return self._x
        }
    }
    public var y: Int{
        get{
            return self._y
        }
    }
    
    public func distanceTo(city: City)->Double{
        let xDistance = Swift.abs(x - city.x)
        let yDistance = Swift.abs(y - city.y)
        let distance = ((Double)((xDistance*xDistance)+(yDistance*yDistance))).squareRoot()
        return distance
    }
    
    public func printCity()->String{
        return "\(self._x), \(self._y)"
    }
}
