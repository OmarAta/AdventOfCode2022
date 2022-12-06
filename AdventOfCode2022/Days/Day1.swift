//
//  Day1.swift
//  AdventOfCode2022
//
//  Created by omar.ata on 12/5/22.
//

import Foundation

class Day1: Day {
    let input = getInputFor(day: 1)
    var calories = [Int]()

    func star1() -> String {
        calories.removeAll()
        let packs = input
            .components(separatedBy: "\n\n")
            .map { $0.components(separatedBy: "\n").map { Int($0) ?? 0 } }
        for pack in packs {
            calories.append(pack.reduce(0, +))
        }
        
        return String(calories.max() ?? 0)
    }
    
    func star2() -> String {
        if (calories.isEmpty) {
            _ = star1()
        }
        
        calories.sort { $0 > $1 }
        return String(calories[0...2].reduce(0, +))
    }
}
