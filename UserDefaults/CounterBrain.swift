//
//  CounterBrain.swift
//  UserDefaults
//
//  Created by Paul Solt on 2/22/18.
//  Copyright © 2018 Paul Solt. All rights reserved.
//

import Foundation

let kNeverModifiedString = "Never"

class CounterBrain {
    
    private var dataModel: CounterModel
    
    var dateString: String {
        get {
            if let dateModified = dataModel.dateModified {
                return dateFormatter.string(from: dateModified)
            } else {
                return kNeverModifiedString
            }
        }
    }
    
    var counter: Int {
        set {
            dataModel.counter = newValue
            dataModel.dateModified = Date()
//            dataModel.save()
        }
        get {
            return dataModel.counter
        }
//        didSet {
//            dataModel.dateModified = Date()
//            dataModel.save()
//        }
    }
    
    init(dataModel: CounterModel = CounterModelUserDefaults()) {
        self.dataModel = dataModel
        //        dateString = "Never"
//        counter = -1
    }
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    func increment() {
        counter += 1
        dataModel.save()
    }
    
    func decrement() {
        counter -= 1
        dataModel.save()
    }
    
    func clear() {
        counter = 0
        dataModel.save()
    }
    
}
