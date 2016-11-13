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
        scoreValue = scoreValue + minusScore(a: aValue, b: bValue)
        scoreLabel.text = String(scoreValue)
        
        repeat {
            aValue = Int(arc4random()) % 50
        } while aValue < 10
        
        repeat {
            bValue = Int(arc4random()) % aValue
        } while bValue < 1
        
        A.text = String(aValue)
        B.text = String(bValue)
        answerField.text = ""
    }
    
    func minusScore(a: Int, b:Int) -> Int {
        var a = a
        var b = b
        var score = 100 // basis point
        while a > 0 && b > 0 {
            if a%10 < b%10 {
                score = score + 100
            }
            a = a / 10
            b = b / 10
        }
        return score
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

