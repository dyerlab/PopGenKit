//
//  ShortestPathTest.swift
//  PopgenKitTests
//
//  Created by Rodney Dyer on 6/14/19.
//

import XCTest

class ShortestPathTest: XCTestCase {

    func testSinglePath() {
        let G = Popgraph()
        
        for label in ["A","B","C","D","E"] {
            G.addNode(label: label, size: 1.0 )
        }

        G.addEdge(from: "A", to: "B", weight: 1.0 )
        G.addEdge(from: "A", to: "D", weight: 4.0 )
        G.addEdge(from: "B", to: "C", weight: 2.0 )
        G.addEdge(from: "B", to: "D", weight: 5.0 )
        G.addEdge(from: "D", to: "E", weight: 8.0 )
        
        
        if let path = shortestPathDijkstra(source: G.getNode(label: "A")!,
                                           destination:  G.getNode(label: "E")!) {
            print("\(path)")
            XCTAssertEqual( path.length, 12.0 )
        }
        else {
            print("could not find path")
        }
        
        
    }

}
