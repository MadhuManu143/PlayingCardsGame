//
//  File.swift
//  PlayingCards
//
//  Created by Madhu Rimmalapudi on 1/3/19.
//  Copyright © 2019 Madhu Rimmalapudi. All rights reserved.
//

import Foundation

struct PlayingCard {
    var suit : Suit
    var rank : Rank
    
    enum Suit : String {
        case spades = "♠️"
        case hearts = "♥️"
        case clubs  = "♣️"
        case diamands = "♦️"
        
        static var allSuits = [Suit.spades,.hearts,.clubs,.diamands]
        
    }
    
    enum Rank {
        case ace
        case numeric(Int)
        case face(String)
        
        var order : Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips) : return pips
            case .face(let kind) where kind == "j" : return 11
            case .face(let kind) where kind == "Q" : return 12
            case .face(let kind) where kind == "K" : return 13
            default: return 0
            }
        }
        
        static var all : [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("j"),.face("Q"),.face("k")]
            return allRanks
        }
        
    }
}
