//
//  ViewController.swift
//  Adventure
//
//  Created by james on 01/11/2016.
//  Copyright © 2016 James. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var A: UILabel!
    @IBOutlet weak var B: UILabel!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var aValue: Int = 0 {
        didSet {
            
        }
    }
    var bValue: Int = 0
    var scoreValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        answerField.keyboardType = .numberPad
        answerField.returnKeyType = .done
        answerField.becomeFirstResponder()
        
        A.text = String(aValue)
        B.text = String(bValue)
        scoreLabel.text = "0"
        
    }
    
    func next(){
        scoreValue = scoreValue + 100
        scoreLabel.text = String(scoreValue)
        
        repeat {
            aValue = Int(arc4random()) % 20
        } while aValue < 10
        
        repeat {
            bValue = Int(arc4random()) % aValue
        } while bValue < 1
        
        A.text = String(aValue)
        B.text = String(bValue)
        answerField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func editingChanged(_ sender: Any) {
        print("Current answer\(answerField.text)")
        
        if aValue - bValue == Int(answerField.text!) {
            next()
        }
    }
}

