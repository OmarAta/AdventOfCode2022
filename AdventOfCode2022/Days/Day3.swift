//
//  Day3.swift
//  AdventOfCode2022
//
//  Created by omar.ata on 12/6/22.
//

import Foundation

class Day3: Day {
    let input = getInputFor(day: 3)
    
    struct Sack {
        let all: Set<Character>
        let comp1: Set<Character>
        let comp2: Set<Character>
        let intersection: Character
    }
    
    var sacks = [Sack]()
    var shared = [Character]()
    
    private func priorityFor(item: Character) -> Int {
        let ascii = Int(UnicodeScalar(String(item))?.value ?? 0)
        switch (item) {
        case "a"..."z": return ascii - 96
        case "A"..."Z": return ascii - 38
        default: return 0
        }
    }
    
    func star1() -> String {
        sacks = input.components(separatedBy: "\n").map {
            let count = $0.count / 2
            let comp1 = Set($0.prefix(count))
            let comp2 = Set($0.suffix(count))
            return Sack(
                all: Set($0),
                comp1: comp1,
                comp2: comp2,
                intersection: comp1.intersection(comp2).first!
            )
        }
        
        var result = 0
        for sack in sacks {
            result += priorityFor(item: sack.intersection)
        }
        
        return "\(result)"
    }
    
    func star2() -> String {
        var result = 0
        for i in sacks.indices {
            if i % 3 == 0 {
                let sack1 = sacks[i]
                let sack2 = sacks[i + 1]
                let sack3 = sacks[i + 2]
                
                let badge = sack1.all.intersection(sack2.all).intersection(sack3.all).first!
                result += priorityFor(item: badge)
            }
        }
        
        return "\(result)"
    }
}
