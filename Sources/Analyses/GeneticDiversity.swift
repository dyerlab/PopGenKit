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
    var ret = [String:Population]()
    if data.count == 0 {
        return nil
    }
    
    
    if data.strata.count == 0 || stratum == nil {
        ret["All Data"] = data
    } else {
        ret = data.partition(stratum: stratum!)
    }
    
    let nrows = ret.count
    
    
    
}
