//
//  Pet.swift
//  Lesson03
//
//  Created by Prima Prasertrat on 1/17/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class Pet: Animal {
    var owner: String?
    
    init(name: String, owner: String?) {
        super.init(name: name)
        self.owner = owner
    }
    
    override func prettyAnimalName() -> String {
        if let someone = self.owner {
            return someone + "'s pet is named " + self.name
        } else {
            return self.name + " needs an owner"
        }
    }

}
