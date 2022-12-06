//
//  Day2.swift
//  AdventOfCode2022
//
//  Created by omar.ata on 12/6/22.
//

import Foundation

class Day2: Day {
    let input = getInputFor(day: 2)
    enum Hand {
        case rock
        case paper
        case scissors
    }
    
    enum HandResult {
        case win
        case draw
        case lose
    }
    
    var myHands = [Hand]()
    var otherHands = [Hand]()
    var myResults = [HandResult]()
    
    private func score(me: Hand, other: Hand) -> Int {
        var result = 0
        
        switch (me) {
        case .rock: result += 1
        case .paper: result += 2
        case .scissors: result += 3
        }
        
        switch (me, other) {
        case (.rock, .rock): result += 3
        case (.rock, .paper): result += 0
        case (.rock, .scissors): result += 6

        case (.paper, .rock): result += 6
        case (.paper, .paper): result += 3
        case (.paper, .scissors): result += 0

        case (.scissors, .rock): result += 0
        case (.scissors, .paper): result += 6
        case (.scissors, .scissors): result += 3
        }
        
        return result
    }
    
    private func decode(hand: String) -> Hand {
        switch (hand) {
        case "A", "X": return .rock
        case "B", "Y": return .paper
        case "C", "Z": return .scissors
        default: return.rock
        }
    }
    
    private func decode(result: String) -> HandResult {
        switch (result) {
        case "X": return .lose
        case "Y": return .draw
        case "Z": return .win
        default: return.draw
        }
    }

    private func myHand(to: HandResult, other: Hand) -> Hand {
        switch (to, other) {
        case (.win, .rock): return .paper
        case (.win, .paper): return .scissors
        case (.win, .scissors): return .rock

        case (.draw, .rock): return .rock
        case (.draw, .paper): return .paper
        case (.draw, .scissors): return .scissors

        case (.lose, .rock): return .scissors
        case (.lose, .paper): return .rock
        case (.lose, .scissors): return .paper
        }
    }

    func star1() -> String {
        myHands.removeAll()
        otherHands.removeAll()
        
        for row in input.components(separatedBy: "\n") {
            let hands = row.components(separatedBy: " ").map { decode(hand: $0) }
            otherHands.append(hands.first!)
            myHands.append(hands.last!)
        }
        
        var totalScore = 0
        for i in myHands.indices {
            totalScore += score(me: myHands[i], other: otherHands[i])
        }
        
        return "\(totalScore)"
    }
    
    func star2() -> String {
        myHands.removeAll()
        otherHands.removeAll()
        for row in input.components(separatedBy: "\n") {
            let round = row.components(separatedBy: " ")
            
            let otherHand = decode(hand: round.first!)
            otherHands.append(otherHand)
            
            let result = decode(result: round.last!)
            myResults.append(result)
            myHands.append(myHand(to: result, other: otherHand))
        }

        var totalScore = 0
        for i in myHands.indices {
            totalScore += score(me: myHands[i], other: otherHands[i])
        }
        
        return "\(totalScore)"
    }
}
