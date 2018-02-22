//
//  CounterModel.swift
//  UserDefaults
//
//  Created by Paul Solt on 2/22/18.
//  Copyright © 2018 Paul Solt. All rights reserved.
//

import Foundation

let kCounterKey = "counterKey"
let kDateKey = "dateKey"

protocol CounterModel {
    var counter: Int { get set }
    var dateModified: Date? { get set }
    func save()
    func load()
}

class CounterModelUserDefaults: CounterModel {
    let defaults: UserDefaults
    
    var counter: Int
    var dateModified: Date?
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.defaults = userDefaults
        
        counter = -1
        dateModified = nil
        
        load()
    }
    
    func save() {
        print(#function)
        defaults.set(counter, forKey: kCounterKey)
        defaults.set(dateModified, forKey: kDateKey)
//        defaults.synchronize()
    }
    
    func load() {
        if let counter = defaults.value(forKey: kCounterKey) as? Int {
            print("Loaded counter: \(counter)")
            self.counter = counter
        } else {
            print("nil counter for key: \(kCounterKey)")
        }
        
        if let date = defaults.value(forKey: kDateKey) as? Date {
            print("Loaded date: \(date)")
            self.dateModified = date
        } else {
            print("nil date for key: \(kDateKey)")
        }
        
    }
}
