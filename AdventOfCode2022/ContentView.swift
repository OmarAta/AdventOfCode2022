//
//  ContentView.swift
//  AdventOfCode2022
//
//  Created by omar.ata on 12/5/22.
//

import SwiftUI

struct ContentView: View {
    @State var result = ""
    let days: [Day] = [Day1(), Day2(), Day3(), Day4()]
    var body: some View {
        VStack {
            Image(systemName: "line.horizontal.star.fill.line.horizontal")
                .imageScale(.large)
            Text("Advent Of Code 2022")
            
            TextField("result", text: $result)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
            
            ForEach(Array(days.enumerated()), id: \.offset) { index, day in
                HStack {
                    Text("Day \(index + 1)")
                    Button("★") { result = day.star1() }
                    Button("⭐️") { result = day.star2() }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

protocol Day {
    func star1() -> String
    func star2() -> String
}

func getInputFor(day: Int) -> String {
    var result = ""
    if let url = Bundle.main.url(forResource: "Input\(day)", withExtension: "") {
        do {
            result = try String(contentsOf: url).trimmingCharacters(in: .whitespacesAndNewlines)
        }
        catch {}
    }
    
    return result
}
