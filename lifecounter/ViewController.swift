//
//  ViewController.swift
//  lifecounter
//
//  Created by Wensi Xu on 4/20/22.
//

import UIKit

class ViewController: UIViewController {
    var player1LifeTotal = 20
    var player2LifeTotal = 20
    
    @IBOutlet weak var player1LifeLabel: UILabel!
    @IBOutlet weak var player2LifeLabel: UILabel!
    @IBOutlet weak var loseMessageLabel: UILabel!
    
    @IBAction func p1PlusBtn(_ sender: UIButton) {
        player1LifeTotal += 1
        displayPlayer1Life()
    }
    
    @IBAction func p1MinusBtn(_ sender: UIButton) {
        player1LifeTotal -= 1
        displayPlayer1Life()
    }
    @IBAction func p1PlusFiveBtn(_ sender: UIButton) {
        player1LifeTotal += 5
        displayPlayer1Life()
    }
    
    @IBAction func p1MinusFiveBtn(_ sender: UIButton) {
        player1LifeTotal -= 5
        displayPlayer1Life()
    }
    
    
    @IBAction func p2PlusBtn(_ sender: Any) {
        player2LifeTotal += 1
        displayPlayer2Life()
    }
    
    @IBAction func p2MinusBtn(_ sender: Any) {
        player2LifeTotal -= 1
        displayPlayer2Life()
    }
    
    @IBAction func p2PlusFiveBtn(_ sender: Any) {
        player2LifeTotal += 5
        displayPlayer2Life()
    }
    
    @IBAction func p2MinusFiveBtn(_ sender: Any) {
        player2LifeTotal -= 5
        displayPlayer2Life()
    }
    
    func displayPlayer1Life() {
        if (player1LifeTotal <= 0) {
            loseMessageLabel.text = "Player 1 LOSES!"
            loseMessageLabel.textColor = UIColor.red

            player1LifeLabel.text = "0"
        } else {
            player1LifeLabel.text = "\(player1LifeTotal)"
        }
    }
    
    func displayPlayer2Life() {
        if (player2LifeTotal <= 0) {
            loseMessageLabel.text = "Player 2 LOSES!"
            loseMessageLabel.textColor = UIColor.red
            player2LifeLabel.text = "0"
        } else {
            player2LifeLabel.text = "\(player2LifeTotal)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

