//
//  ViewController.swift
//  PlayingCards
//
//  Created by Madhu Rimmalapudi on 1/3/19.
//  Copyright © 2019 Madhu Rimmalapudi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dackofCards = PlayingCardDack()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...10 {
            if let card = dackofCards.draw() {
                print("\(card)")
            }else{
                print("dack empty")
            }
            
        }
    }


}

