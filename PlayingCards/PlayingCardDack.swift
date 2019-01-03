//
//  PlayingCardDack.swift
//  PlayingCards
//
//  Created by Madhu Rimmalapudi on 1/3/19.
//  Copyright © 2019 Madhu Rimmalapudi. All rights reserved.
//

import Foundation

struct PlayingCardDack {
    private(set) var cards = [PlayingCard]()
    
    init() {
        for suit in PlayingCard.Suit.allSuits {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard.init(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func draw() -> PlayingCard? {
        if cards.count>0 {
            return cards.remove(at: cards.count.arc4random)
        }else{
            return nil
        }
    }
}
extension Int {
    var arc4random : Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else{
            return 0
        }
    }
    
}

