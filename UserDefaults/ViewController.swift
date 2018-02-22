//
//  ViewController.swift
//  UserDefaults
//
//  Created by Paul Solt on 2/22/18.
//  Copyright © 2018 Paul Solt. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var counterBrain: CounterBrain!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
//        let defaults = UserDefaults.standard
//
//        if let loadedCounter = defaults.value(forKey: kCounterKey) as? Int {
//            print("Loaded counter: \(loadedCounter)")
//        } else {
//            print("nil counter for key: \(kCounterKey)")
//        }
//
//        if let loadedDate = defaults.value(forKey: kDateKey) as? Date {
//            print("Loaded date: \(loadedDate)")
//        } else {
//            print("nil date for key: \(kDateKey)")
//        }
//
//
//        let counter = 10
//        defaults.set(counter, forKey: kCounterKey)
//
//
//        let date = NSDate()
//        defaults.set(date, forKey: kDateKey)
        
        
        updateDisplay()
        
    
    }
    
    @IBAction func minusButtonPressed(_ sender: Any) {
        counterBrain.decrement()
        updateDisplay()
    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        
        counterBrain.increment()
        updateDisplay()
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        counterBrain.clear()
        updateDisplay()
    }
    
    func updateDisplay() {
        counterLabel.text = "\(counterBrain.counter)"
        dateLabel.text = counterBrain.dateString
    }
}




