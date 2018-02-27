//
//  ViewController.swift
//  UserDefaults
//
//  Created by Paul Solt on 2/22/18.
//  Copyright © 2018 Paul Solt. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    var counterBrain: CounterBrain!

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        assert(counterBrain != nil, "Counter Brain must be set before using property via dependency injection")
        
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
    
    @IBAction func share(_ sender: Any) {
        let textToShare = "I just used counter!\n\(dateLabel.text!)\nMy total is \(counterLabel.text!)!\n"
        let igmWebsite = NSURL(string: "http://igm.rit.edu/")
        let objectsToShare:[AnyObject] = [textToShare as AnyObject, igmWebsite!]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivityType.print]
        self.present(activityVC, animated: true, completion: nil)
    }

    func updateDisplay() {
        counterLabel.text = "\(counterBrain.counter)"
        dateLabel.text = counterBrain.dateString
    }
}




