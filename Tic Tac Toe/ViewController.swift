//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Yasoob  Rasheed on 7/3/15.
//  Copyright © 2015 Yasoob Rasheed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var playerName1: UITextField!
    @IBOutlet weak var playerName2: UITextField!
    
    @IBOutlet weak var label1: GridLabel!
    @IBOutlet weak var label2: GridLabel!
    @IBOutlet weak var label3: GridLabel!
    @IBOutlet weak var label4: GridLabel!
    @IBOutlet weak var label5: GridLabel!
    @IBOutlet weak var label6: GridLabel!
    @IBOutlet weak var label7: GridLabel!
    @IBOutlet weak var label8: GridLabel!
    @IBOutlet weak var label9: GridLabel!
    
    var labelsArray : [GridLabel!] = []
    var xTurn = true
    var nameBox1 = ""
    var nameBox2 = ""
    var totalTurns = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerName1.text = nameBox1
        playerName2.text = nameBox2
        labelsArray = [label1, label2, label3, label4, label5, label6, label7, label8, label9 ]
    }
    
    func check() {
        
        checkForWinner(labelsArray[0], b: labelsArray[1], c: labelsArray[2])
        checkForWinner(labelsArray[3], b: labelsArray[4], c: labelsArray[5])
        checkForWinner(labelsArray[6], b: labelsArray[7], c: labelsArray[8])
        checkForWinner(labelsArray[0], b: labelsArray[3], c: labelsArray[6])
        checkForWinner(labelsArray[1], b: labelsArray[4], c: labelsArray[7])
        checkForWinner(labelsArray[2], b: labelsArray[5], c: labelsArray[8])
        checkForWinner(labelsArray[0], b: labelsArray[4], c: labelsArray[8])
        checkForWinner(labelsArray[2], b: labelsArray[4], c: labelsArray[6])
    }
    
    func checkForWinner(a: GridLabel, b: GridLabel, c: GridLabel) {
        
        if a.text != "" && a.text == b.text && b.text == c.text {
            if a.text == "X" {
                let name1 = playerName1.text
                winnerLabel.text = "\(name1!) Wins!"
                presentWinningAlert("\(name1)")
            }
            
            if a.text == "O" {
                let name2 = playerName2.text
                winnerLabel.text = "\(name2!) Wins!"
                presentWinningAlert("\(name2)")
                
            }
        }
    }
    @IBAction func onScreenTapped(sender: UITapGestureRecognizer) {
        for labels in labelsArray {
            if CGRectContainsPoint(labels.frame, sender.locationInView(backgroundView)) {
                if labels.canTap {
                    labels.canTap = false
                    
                    if xTurn {
                        labels.text = "X"
                        totalTurns++
                    } else {
                        labels.text = "O"
                        totalTurns++
                    }
                    xTurn = !xTurn
                    check()
                }
                
                if (totalTurns % 9 == 0){
                    let noone = "Nobody"
                    winnerLabel.text = "Draw"
                    presentWinningAlert("\(noone)")
                }
            }
        }
    }
    
    func reset() {
        winnerLabel.text = ""
        label1.text = ""
        label1.canTap = true
        label2.text = ""
        label2.canTap = true
        label3.text = ""
        label3.canTap = true
        label4.text = ""
        label4.canTap = true
        label5.text = ""
        label5.canTap = true
        label6.text = ""
        label6.canTap = true
        label7.text = ""
        label7.canTap = true
        label8.text = ""
        label8.canTap = true
        label9.text = ""
        label9.canTap = true
        xTurn = true
    }
    
    func presentWinningAlert(winner: String) {
        let alert = UIAlertController(title: "Game Over", message: nil, preferredStyle: .Alert)
        
        let mainMenuAction = UIAlertAction(title: "Main Menu", style: UIAlertActionStyle.Destructive, handler: { (action) -> Void in
            navigationController!.popToRootViewControllerAnimated(true)
        })
        alert.addAction(mainMenuAction)
        
        let playAgainAction = UIAlertAction(title: "Play Again", style: .Default) {
            (action) -> Void in self.reset()
        }
        alert.addAction(playAgainAction)

        self.presentViewController(alert, animated: true, completion: nil)
    }
}

