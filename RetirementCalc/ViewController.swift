//
//  ViewController.swift
//  RetirementCalc
//
//  Created by Raghavendra Kulal on 03/03/22.
//

import UIKit
import AppCenterCrashes

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickButton(_ sender: Any) {
        Crashes.generateTestCrash()
    }
    
}

