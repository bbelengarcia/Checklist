//
//  ViewController.swift
//  Checklist
//
//  Created by Belen Garcia Muñoz on 28/02/2020.
//  Copyright © 2020 Belen Garcia Muñoz. All rights reserved.
//

import UIKit

class TestChecklistViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

//Provides data to the table
extension TestChecklistViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return 1000
    }
    
    //Every time a table view needs a cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Create a cell
        //The identifier is the name of the cell in the storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        if let label = cell.viewWithTag(1000) as? UILabel{
        
            if indexPath.row % 5 == 0{
                label.text = "5 Take a jog"
            }else if indexPath.row % 4 == 0 {
                label.text = "4 Watch a movie"
            }else if indexPath.row % 3 == 0{
                label.text = "3 Code an app"
            } else if indexPath.row % 2 == 0{
                label.text = "2 Walk the dog"
            }  else if indexPath.row % 1 == 0{
                label.text = "1 Study design patterns"
            }
            
        }
        return cell
    }
}

//Iteract to the table
extension TestChecklistViewController: UITableViewDelegate{
    
}
