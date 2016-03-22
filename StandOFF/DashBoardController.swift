//
//  DashBoardController.swift
//  StandOFF
//
//  Created by Diego Aguirre on 3/21/16.
//  Copyright © 2016 home. All rights reserved.
//

import UIKit

class DashBoardController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(DashBoardController.updateLabel), name: "secondTick", object: nil)
    }
    
    
    @IBAction func StartButtonPressed(sender: AnyObject) {
        timer.startTimer()
        timerLabel.text = timer.string
        
    }
    
    @IBAction func StopButtonPressed(sender: AnyObject) {
      timer.stopTimer()
      timerLabel.text = ""
        
    }
   
    func updateLabel() {
        timerLabel.text = timer.string
    }
    
}

