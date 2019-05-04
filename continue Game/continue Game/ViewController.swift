//
//  ViewController.swift
//  continue Game
//
//  Created by 彭军涛 on 2018/8/5.
//  Copyright © 2018 彭军涛. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var filpCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(filpCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBAction func changEmjo(_ sender: UIButton) {
        filpCount += 1
        
    }
    


}

