//
//  ViewController.swift
//  UserDefaults
//
//  Created by Paul Solt on 2/22/18.
//  Copyright © 2018 Paul Solt. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var counterBrain: CounterBrain!
    var backgroundImage:UIImage?
    
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
        let image = self.view.takeSnapshot()
        let textToShare = "I just used counter!\n\(dateLabel.text!)\nMy total is \(counterLabel.text!)!\n"
        let igmWebsite = NSURL(string: "http://igm.rit.edu/")
        let objectsToShare:[AnyObject] = [textToShare as AnyObject, igmWebsite!, image!]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivityType.print]
        self.present(activityVC, animated: true, completion: nil)
    }

    @IBAction func cameraButtonTapped(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        //if UIImagePickerController.isSourceTypeAvailable(.camera){
        // imagePickerController.sourceType = .camera
        // }else{
        //  imagePickerController.sourceType = .savedPhotosAlbum
        //}
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: -UIImagePickerController Delegate Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("finished picking")
        let image:UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        backgroundImage = image
        (self.view as! UIImageView).contentMode = .center
        (self.view as! UIImageView).image = backgroundImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled")
        picker.dismiss(animated: true, completion: nil)
    }
    
    func updateDisplay() {
        counterLabel.text = "\(counterBrain.counter)"
        dateLabel.text = counterBrain.dateString
    }
}




