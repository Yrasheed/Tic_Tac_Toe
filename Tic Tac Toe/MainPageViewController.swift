//
//  MainPageViewController.swift
//  Tic Tac Toe
//
//  Created by Yasoob  Rasheed on 7/4/15.
//  Copyright © 2015 Yasoob Rasheed. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {
    
    var playerOne : String!
    var playerTwo : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSingleplayerButtonTapped(sender: UIButton) {
        
    }
    
    @IBAction func onMultiplayerButtonTapped(sender: UIButton) {
        displayAlert2Names()
        self.view.endEditing(true)
    }
    
    func displayAlert2Names() {
        let alert = UIAlertController(title: "Who's Who?", message: nil, preferredStyle: .Alert)
        var textField1 : UITextField?
        var textField2 : UITextField?
        
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField1 = textField
            textField.placeholder = "Enter player 1 name here"
        }
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField2 = textField
            textField.placeholder = "Enter player 2 name here"
        }
        
        let okAction = UIAlertAction(title: "Play!", style: .Default, handler: ({action in
            self.playerOne = textField1!.text!
            self.playerTwo = textField2!.text!
            self.performSegueWithIdentifier("multiplayerSegueToBoard1", sender: self)
        }))
        alert.addAction(okAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc1 = segue.destinationViewController as! ViewController
        dvc1.nameBox1 = playerOne
        let dvc2 = segue.destinationViewController as! ViewController
        dvc2.nameBox2 = playerTwo
    }
}


