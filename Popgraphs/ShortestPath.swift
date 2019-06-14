//
//  ShortestPath.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/14/19.
//

import Foundation


/// This implements the Djikstra's Algorithm.
func shortestPathDijkstra(source: PopgraphNode, destination: PopgraphNode) -> PopgraphPath? {
    
    var frontier: [PopgraphPath] = [] {
        didSet { frontier.sort {return $0.length < $1.length } }
    }
    
    frontier.append(PopgraphPath(to: source))
    
    
    while !frontier.isEmpty {
        let cheapestPathInFrontier = frontier.removeFirst()
        guard !cheapestPathInFrontier.destination.selected else { continue }
        
        if cheapestPathInFrontier.destination == destination {
            return cheapestPathInFrontier
        }
        
        cheapestPathInFrontier.destination.selected = true
        
        for connection in cheapestPathInFrontier.destination.edges where !connection.connectedTo(source: cheapestPathInFrontier.destination).selected {
            frontier.append( PopgraphPath(to: connection.connectedTo(source: cheapestPathInFrontier.destination), via: connection, previous: cheapestPathInFrontier))
        }
    }
    return nil
}

/// This does the whole, all-pairs paths.
///
/// - Parameter G: An instance of a `Popgraph`.
///
/// - Returns: A Matrix of all pairs shortest distance.  Unaccessable nodes will be `Double.infinity`
func shortestPath( G: Popgraph ) -> Matrix {
    
    let allNodes = G.nodes.map{$0.label}.sorted()
    
    G.nodes.forEach{ node in
        node.selected = false
    }
    
    var ret = Matrix(rows: allNodes.count, cols: allNodes.count, val: Double.infinity )
    ret.rowNames = allNodes
    ret.colNames = allNodes
    
    for i in 0 ..< allNodes.count {
        for j in i ..< allNodes.count {
            let path = shortestPathDijkstra(source: G.nodes[i], destination: G.nodes[j] )
            ret[i,j] = path?.length ?? Double.infinity
            ret[j,i] = path?.length ?? Double.infinity
        }
    }
    
    G.nodes.forEach{ node in
        node.selected = false
    }

    print("Shortest Path: \n\(ret)")
    
    return ret
}
