//
//  GenaticAlgo.swift
//  salesManProblemGenatic
//
//  Created by Ahmed masoud on 3/20/17.
//  Copyright © 2017 Amasoud. All rights reserved.
//

import Foundation

public class GenaticAlgo{
    private static let mutationRate = 0.015
    private static let tournamentSize = 5
    private static let elitism = true
    
    public static func evolvePopulation(pop: Population)->Population{
        let newPopulation = Population(count: pop.populationSize(), initializ: false)
        var offset = 0
        if elitism {
            newPopulation.setRoute(route: pop.getBestRoute(), index: 0)
            offset = 1
        }
        var i = offset
        while i < newPopulation.populationSize() {
            let parent1 = GenaticAlgo.crossOverSelection(pop: pop)
            let parent2 = GenaticAlgo.crossOverSelection(pop: pop)
            let offSpring = crossOver(parent1: parent1, parent2: parent2)
            newPopulation.setRoute(route: offSpring, index: i)
            i+=1
            
        }
        i = offset
        while i < newPopulation.populationSize() {
            mutate(route: newPopulation.getRoute(index: i))
            i+=1
        }
        return newPopulation
        
    }
    
    private static func mutate(route: Route){
        var pos1 = 0
        while pos1 < route.numberOfCitiesInRoute() {
            if mutationRate >= drand48() {
                let pos2 = Int(arc4random_uniform(UInt32(route.numberOfCitiesInRoute())))
                let city1 = route.getCity(pos: pos1)
                let city2 = route.getCity(pos: pos2)
                route.setCity(city: city1, pos: pos2)
                route.setCity(city: city2, pos: pos1)
            }
            pos1+=1
        }
    }
    
    private static func crossOver(parent1: Route, parent2: Route)->Route{
        let offSpring = Route()
        let startPos = Int(arc4random_uniform(UInt32(parent1.numberOfCitiesInRoute())))
        let endPos = Int(arc4random_uniform(UInt32(parent1.numberOfCitiesInRoute())))
        var i = 0
        while i < parent1.numberOfCitiesInRoute() {
            if startPos < endPos && i > startPos && i < endPos {
                offSpring.setCity(city: parent1.getCity(pos: i), pos: i)
            }
            else if startPos > endPos {
                if (i < startPos && i > endPos) {
                    offSpring.setCity(city: parent1.getCity(pos: i), pos: i)
                }
            }
            i+=1
        }
        i=0
        while i < parent2.numberOfCitiesInRoute() {
            if !(offSpring.containsCity(city: parent2.getCity(pos: i),its: parent2.numberOfCitiesInRoute())) {
                offSpring.setCity(city: parent2.getCity(pos: i), pos: 100);
                i=0
                continue
            }
            i+=1
        }
        
        return offSpring
    }
    public static func crossOverSelection(pop: Population)->Route{
        let tournament: Population = Population(count: tournamentSize, initializ: false)
        var i = 0
        while i < tournamentSize {
            let randomId = Int(arc4random_uniform(UInt32(pop.populationSize())))
            tournament.setRoute(route: pop.getRoute(index: randomId), index: i)
            i+=1
        }
        return tournament.getBestRoute()
    }
    
    
    
}
