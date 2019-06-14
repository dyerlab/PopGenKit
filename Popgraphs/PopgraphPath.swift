//
//  PopgraphPath.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/14/19.
//

import Foundation

class PopgraphPath {
    var length: Double
    var destination: PopgraphNode
    var previous: PopgraphPath?
    
    init(to node: PopgraphNode, via connection: PopgraphEdge? = nil, previous path: PopgraphPath? = nil ) {
        if let previousPath = path, let viaConnection = connection {
            self.length = viaConnection.weight + previousPath.length
        } else {
            length = 0.0
        }
        self.destination = node
        self.previous = path
    }
}




extension PopgraphPath : CustomStringConvertible {
    var description: String {
        var ret = "Path: \(destination) ( \(length) ) \n"
        if let prev = previous {
            ret += "\(prev)"
        } else {
            ret += " -|"
        }
        return ret
    }
    
}
