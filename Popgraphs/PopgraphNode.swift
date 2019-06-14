//
//  PopgraphNode.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/14/19.
//

import Foundation

class PopgraphNode {
    var size: Double
    var label: String
    var edges: [PopgraphEdge]
    var selected: Bool 
    
    init(label: String, size: Double ) {
        self.size = size
        self.label = label
        self.edges = [PopgraphEdge]()
        self.selected = false
    }
}






extension PopgraphNode: Equatable {
    static func == (lhs: PopgraphNode, rhs: PopgraphNode) -> Bool {
        return lhs.size == rhs.size &&
                lhs.label == rhs.label &&
                lhs.edges == rhs.edges
    }
}
