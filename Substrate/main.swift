//
//  main.swift
//  Substrate
//
//  Created by James on 10/10/2016.
//  Copyright © 2016 James. All rights reserved.
//

//import Foundatio
import Cocoa
import Darwin

// a 1 based array
struct Memory {
    let rows: Int, columns: Int
    var grid: [Int]
    var totalTime: Int
    let initTime = 99
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0, count: rows*columns)
        totalTime = (rows + 1 ) * rows * initTime / 2
        
        for var x in 1...rows {
            for var y in 1...columns {
                if indexIsValid(row: x, column: y) {
                    grid[(x - 1) * columns + y - 1] = initTime
                }
            }
        }
        
    }
    
    func indexIsValid(row: Int, column: Int)-> Bool {
        return row >= 1 && column >= 1 &&
            row >= column
            && row <= rows && column <= columns
        
    }
    
    subscript(row: Int, column: Int)-> Int {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row-1)*columns+column-1]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            totalTime = totalTime - grid[(row-1)*columns+column-1] + newValue
            grid[(row-1)*columns+column-1]=newValue
        }
    }
    
    func next() -> (Int, Int) {
        var rand = Int(arc4random()) % totalTime
        for var x in 1...rows {
            for var y in 1...columns {
                if indexIsValid(row: x, column: y){
                    rand = rand - self[x,y]
                    if rand <= 0 {
                        return (x,y)
                    }
                }
            }
        }
        return (0,0)
    }
    func dump() {
        for var x in 1...rows {
            for var y in 1...columns {
                if indexIsValid(row: x, column: y){
                    let value = grid[(x-1)*columns+y-1]
                    if value >= initTime {
                        print ("- ", terminator:"")
                    } else {
                        print (String(grid[(x-1)*columns+y-1])+" ", terminator:"")
                    }
                }
            }
            print()
        }
    }
}

func say(_ something: String){
    Process.launchedProcess(launchPath: "/usr/bin/say",
                            arguments: ["-v", "Victoria", something]).waitUntilExit()
}

var memory = Memory(rows: 20, columns:20)

var (a, b) = memory.next()
var beginTime = Date()

repeat {
    print("\n\(a)-\(b)=", terminator:"")
    say("\(a) minus \(b)=")
    guard let answer = readLine() else { exit(2) }
    
    if ( Int(answer) != (a - b) || answer.isEmpty ) {
        if(answer == "q") {
            exit(0)
        }
        print ("Try again.")
        say ("Try again.")
    } else {
        print("Yes.🎉")
        say("Yes")
        var elapsedTime = Date().timeIntervalSince(beginTime)
        memory[a,b] = Int(elapsedTime)
        (a,b) = memory.next()
        beginTime = Date()
        memory.dump()
    }
    
    
} while ( true )

