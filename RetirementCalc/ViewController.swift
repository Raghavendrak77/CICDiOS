//
//  ViewController.swift
//  RetirementCalc
//
//  Created by Raghavendra Kulal on 03/03/22.
//

import UIKit
import AppCenterCrashes
import AppCenterAnalytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Analytics.trackEvent("App launched")
        // Do any additional setup after loading the view.
    }

    @IBAction func clickButton(_ sender: Any) {
        Analytics.trackEvent("Button clicked")
//        Crashes.generateTestCrash()
    }
    
}

