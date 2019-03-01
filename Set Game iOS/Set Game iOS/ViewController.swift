//
//  ViewController.swift
//  Set Game iOS
//
//  Created by Mian Hashim Shah on 2/24/19.
//  Copyright © 2019 Mian Hashim Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet var cardButtonCollection: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide all the cards
        for index in cardButtonCollection.indices {
            cardButtonCollection[index].isHidden = true
        }
        // Place the start button in the center of screen
        startButton.frame.origin = CGPoint(x: 150, y: 350)
        
        // Hide the score label
        scoreLabel.isHidden = true
    }
}

