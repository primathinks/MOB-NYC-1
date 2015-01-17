//
//  Pet.swift
//  Lesson03
//
//  Created by Prima Prasertrat on 1/17/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class Pet: Animal {
    
    override init(name: String) {
        super.init(name: name)
    }
    
    override func prettyAnimalName() -> String {
        return "My favorite pet is " + self.name
    }

}
