//
//  ViewController.swift
//  randQ
//
//  Created by David Haselberger on 22.04.18.
//  Copyright © 2018 Soleil Alpin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var poolLabel: UILabel!
    
    @IBOutlet weak var poolSelection: UISegmentedControl!
    
    @IBOutlet weak var questionChoice: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func chooseQuestion()
    {
        let myCurrentPool:String? = poolSelection.titleForSegment(at: poolSelection.selectedSegmentIndex)
        poolLabel.text = "Pool:" + myCurrentPool!
        let currentPool:UInt32? = UInt32(myCurrentPool!)! - 1
        
        let selectedQuestion:Int? = Int(arc4random_uniform(currentPool! + 1)) + 1
        questionLabel.text = String(selectedQuestion!)
        questionChoice.isHidden = true
        poolSelection.isHidden = true
        nextButton.isHidden = false
        
    }

    @IBAction func resetQuestionChoice()
    {
        questionChoice.isHidden = false
        poolSelection.isHidden = false
        nextButton.isHidden = true
    }
}

