//
//  Day5.swift
//  AdventOfCode2022
//
//  Created by omar.ata on 12/8/22.
//

import Foundation

class Day5: Day {
    let input = getInputFor(day: 5)
    
    struct Operation {
        let count: Int
        let from: String
        let to: String
    }
    
    var crates = Dictionary<String, [Character]>()
    var operations = [Operation]()
    var cratesCount = 0
    
    func star1() -> String {
        prepareCrates()
        
        for operation in operations {
            for _ in 0 ..< operation.count {
                let item = crates[operation.from]!.popLast()!
                crates[operation.to]?.append(item)
            }
        }

        return compileResult()
    }
    
    func star2() -> String {
        prepareCrates()
        
        for operation in operations {
            let from = crates[operation.from]!
            let items = from.dropFirst(from.count - operation.count)
            crates[operation.from]?.removeLast(operation.count)
            crates[operation.to]?.append(contentsOf: items)
        }
        
        return compileResult()
    }
    
    private func prepareCrates() {
        crates.removeAll()
        operations.removeAll()

        var cratesRaw = input.components(separatedBy: "\n\n").first!.components(separatedBy: "\n")
        cratesCount = cratesRaw.removeLast().split(separator: " ").count
        let operationsRaw = input.components(separatedBy: "\n\n").last!.components(separatedBy: "\n")
        
        for i in 1 ... cratesCount {
            crates["\(i)"] = [Character]()
        }
        
        for row in cratesRaw.reversed() {
            let items = Array(row)
            for i in 0 ..< cratesCount {
                let crateId = "\(i + 1)"
                let index = (i * 4) + 1
                
                if items.indices.contains(index) && !items[index].isWhitespace {
                    crates[crateId]?.append(items[index])
                }
            }
        }
        
        for row in operationsRaw {
            let components = row.components(separatedBy: " ")
            let count = Int(components[1]) ?? 0
            let from = String(components[3])
            let to = String(components[5])
            operations.append(Operation(count: count, from: from, to: to))
        }
    }
    
    private func compileResult() -> String {
        var result = ""
        for i in 1 ... cratesCount {
            result.append(crates["\(i)"]!.last!)
        }

        return result
    }
}
