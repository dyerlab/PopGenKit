//
//  GeneticDiversity.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/14/19.
//

import Foundation


/// Frequency to table for all and subsets of populations.
///
/// - Parameter data: A `Population` object.
/// - Parameter locus: The locus name to use.
/// - Parameter stratum: The stratum level you want to estimate frequencies across.  If not passed, this
/// will return only the total data allele frequencies.
///
/// - Returns: A `Matrix` object with row and column headers.
func alleleFrequencies( data: Population, locus: String, stratum: String? ) -> Matrix? {
    
    if data.count == 0 {
        return nil
    }
    
    
    if data.strata.count == 0 || stratum == nil {
        return data.frequencies[locus]?.asMatrix()
        
    }
    
    let populations = data.partition(stratum: stratum!)
    let strataNames = populations.keys.sorted()
    let ncol = strataNames.count
    guard let allAlleles = data.frequencies[locus]?.alleles.sorted() else { return nil }
    let nrow = allAlleles.count
    var ret = Matrix(rows: nrow, cols: ncol)
    ret.rowNames = allAlleles
    
    for c in 0 ..< ncol {
        if let freqs = populations[ strataNames[c] ]?.frequencies[locus]?.frequency(alleles: allAlleles) {
            for r in 0 ..< nrow {
                ret[r,c] = freqs[r]
            }
        }
    }

    return ret
}
