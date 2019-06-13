//
//  DiversityType.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/13/19.
//

import Foundation


/// Enumeration across different kinds of genetic diversity to be estimated.
enum GeneticDiversityType: String {
    
    /// The raw number of alleles at a locus
    case A
    /// The number of alleles with a frequency of at least 5%
    case A95
    /// The frequency scaled allelic diversity
    case Ae
    /// Observed heterozygosity
    case Ho
    /// Expected heterozygosity
    case He
}