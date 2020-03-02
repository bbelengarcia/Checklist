//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Belen Garcia Muñoz on 28/02/2020.
//  Copyright © 2020 Belen Garcia Muñoz. All rights reserved.
//

import Foundation

class ChecklistItem{
    var text = ""
    var checked = false
    
    func toggleeChecked(){
        checked = !checked
    }
}
