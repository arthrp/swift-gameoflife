// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

let g = Game(size: 20)

while(true) {
    print("\u{001B}[2J") 
    g.MakeTurn()
    g.Print()
    usleep(250000)
}
