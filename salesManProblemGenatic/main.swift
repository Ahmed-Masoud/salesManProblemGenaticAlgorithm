//
//  main.swift
//  salesManProblemGenatic
//
//  Created by Ahmed masoud on 3/18/17.
//  Copyright © 2017 Amasoud. All rights reserved.
//

import Foundation

var city: City = City(x: 60, y: 200)
RouteManager.addCity(city: city)
var city2: City = City(x: 180, y: 200)
RouteManager.addCity(city: city2)
var city3: City = City(x: 80, y: 180)
RouteManager.addCity(city: city3)
var city4: City = City(x: 140, y: 180)
RouteManager.addCity(city: city4)
var city5: City = City(x: 20, y: 160)
RouteManager.addCity(city: city5)
var city6: City = City(x: 100, y: 160)
RouteManager.addCity(city: city6)
var city7: City = City(x: 200, y: 160)
RouteManager.addCity(city: city7)
var city8: City = City(x: 140, y: 140)
RouteManager.addCity(city: city8)
var city9: City = City(x: 40, y: 120)
RouteManager.addCity(city: city9)
var city10: City = City(x: 100, y: 120)
RouteManager.addCity(city: city10)
var city11: City = City(x: 180, y: 100)
RouteManager.addCity(city: city11)
var city12: City = City(x: 60, y: 80)
RouteManager.addCity(city: city12)
var city13: City = City(x: 120, y: 80)
RouteManager.addCity(city: city13)
var city14: City = City(x: 180, y: 60)
RouteManager.addCity(city: city14)
var city15: City = City(x: 20, y: 40)
RouteManager.addCity(city: city15)
var city16: City = City(x: 100, y: 40)
RouteManager.addCity(city: city16)
var city17: City = City(x: 200, y: 40)
RouteManager.addCity(city: city17)
var city18: City = City(x: 20, y: 20)
RouteManager.addCity(city: city18)
var city19: City = City(x: 60, y: 20)
RouteManager.addCity(city: city19)
var city20: City = City(x: 160, y: 20)
RouteManager.addCity(city: city20)
var city21: City = City(x: 165, y: 20)
RouteManager.addCity(city: city21)
var city22: City = City(x: 10, y: 20)
RouteManager.addCity(city: city22)
var city23: City = City(x: 15, y: 18)
RouteManager.addCity(city: city23)
var city24: City = City(x: 1, y: 4)
RouteManager.addCity(city: city24)





var pop: Population = Population(count: 50,initializ: true)
print(pop.getBestRoute().getDistance())
pop = GenaticAlgo.evolvePopulation(pop: pop)
var i = 0
while i < 100{
    pop = GenaticAlgo.evolvePopulation(pop: pop)
    i+=1
}
print(pop.getBestRoute().printRoute())
print(pop.getBestRoute().getDistance())





