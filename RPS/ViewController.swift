//
//  ViewController.swift
//  RPS
//
//  Created by Jon on 1/5/19.
//  Copyright © 2019 addevtec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var robotLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var botChoiceLabel: UILabel!
    @IBOutlet weak var yourChoiceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playAgainButton.isHidden = true
        botChoiceLabel.isHidden = true
        yourChoiceLabel.isHidden = true
    
    }

    func resetBoard() {
        robotLabel.text = "🤖"
        titleLabel.text = "Rock, Paper, Scissors?"
        rockButton.isHidden = false
        rockButton.isEnabled = true
        paperButton.isHidden = false
        paperButton.isEnabled = true
        scissorsButton.isHidden = false
        scissorsButton.isEnabled = true
        playAgainButton.isHidden = true
        botChoiceLabel.isHidden = true
        yourChoiceLabel.isHidden = true
    }
    
    func play(_ playerTurn: Sign) {
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        let opponent = randomSign()
        
        let gameResult = playerTurn.takeTurn(opponent)
        robotLabel.text = opponent.emoji
        
        switch gameResult {
        case .draw:
            botChoiceLabel.isHidden = false
            yourChoiceLabel.isHidden = false
            titleLabel.text = "It's a draw."
        case .lose:
            botChoiceLabel.isHidden = false
            yourChoiceLabel.isHidden = false
            titleLabel.text = "Sorry, you lost... RIP ☹️ "
        case .win:
            botChoiceLabel.isHidden = false
            yourChoiceLabel.isHidden = false
            titleLabel.text = "You won! 😃"
        case .start:
            titleLabel.text = "Rock, Paper, Scissors?"
        }
        
        switch playerTurn {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        
        playAgainButton.isHidden = false
        
    }
    
    
    @IBAction func playAgainSelected(_ sender: Any) {
        resetBoard()
    }
    
    @IBAction func rockSelected(_ sender: Any) {
        play(Sign.rock)
    }
    
    @IBAction func paperSelected(_ sender: Any) {
        play(Sign.paper)
    }
    
    @IBAction func scissorsSelected(_ sender: Any) {
    play(Sign.scissors)
    }
    
}

