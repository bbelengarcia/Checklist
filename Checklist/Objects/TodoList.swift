//
//  TodoList.swift
//  Checklist
//
//  Created by Belen Garcia Muñoz on 28/02/2020.
//  Copyright © 2020 Belen Garcia Muñoz. All rights reserved.
//

import Foundation


class TodoList {
    var todos: [ChecklistItem] = []
    
    init (){
        let row0Item = ChecklistItem()
        let row1Item = ChecklistItem()
        let row2Item = ChecklistItem()
        let row3Item = ChecklistItem()
        let row4Item = ChecklistItem()
        
        row0Item.text = "take a jog"
        row1Item.text = "Wacth a movie"
        row2Item.text = "Code an app"
        row3Item.text = "Walk the dog"
        row4Item.text = "Study designed patterns"
        
        todos.append(row0Item)
        todos.append(row1Item)
        todos.append(row2Item)
        todos.append(row3Item)
        todos.append(row4Item)
    }
    
    func newTodo() -> ChecklistItem {
        let item = ChecklistItem()
        item.text = randomTitle()
        item.checked = true
        todos.append(item)
        return item
    }
    private func randomTitle() -> String {
        let titles = ["1", "2", "3", "4", "5"]
        let randomNumer = Int.random(in: 0 ... titles.count-1)
        return titles[randomNumer]
    }
}
