//
//  Day4.swift
//  AdventOfCode2022
//
//  Created by omar.ata on 12/6/22.
//

import Foundation

class Day4: Day {
    let input = getInputFor(day: 4)
    var pairs = [(Set<Int>, Set<Int>)]()

    
    func star1() -> String {
        pairs.removeAll()
        
        for line in input.components(separatedBy: "\n") {
            let ranges = line.components(separatedBy: ",").map {
                let bounds = $0.components(separatedBy: "-").map { Int($0) ?? 0 }
                return Set(bounds.first! ... bounds.last!)
            }
            pairs.append((ranges.first!, ranges.last!))
        }
        
        var result = 0
        for pair in pairs {
            let intersection = pair.0.intersection(pair.1)
            if (intersection == pair.0 || intersection == pair.1) {
                result += 1
            }
        }
        
        return "\(result)"
    }
    
    func star2() -> String {
        if pairs.isEmpty {
            _ = star1()
        }
        
        var result = 0
        for pair in pairs {
            let intersection = pair.0.intersection(pair.1)
            if !intersection.isEmpty {
                result += 1
            }
        }

        return "\(result)"
    }
}
