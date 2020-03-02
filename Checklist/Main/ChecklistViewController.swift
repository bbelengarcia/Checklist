//
//  ViewController.swift
//  Checklist
//
//  Created by Belen Garcia Muñoz on 28/02/2020.
//  Copyright © 2020 Belen Garcia Muñoz. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    
    @IBOutlet weak var testBarButtonItem: UIBarButtonItem!
    @IBAction func testAction(_ sender: Any) {
        self.performSegue(withIdentifier: "ViewToTest", sender: nil)
    }
    
    var todoList: TodoList
    
    @IBAction func addItem (_ sender: Any){
        let newRowIndex = todoList.todos.count
        _ = todoList.newTodo()  //Not interesting on working with the return of this method
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    
    required init? (coder aDecoder: NSCoder){
        todoList = TodoList()
        
        super.init(coder: aDecoder)
    }
    
    //info inicial
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Navigation controler
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //numer of rows
        return todoList.todos.count
    }
    
    //Siempre que la tabla necesita una celda
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cellForRowAt salta cuando se pinta una celda
        //Create a cell
        //The identifier is the name of the cell in the storyboard
        //Celdas reutilizables
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath) //El identificador deberia estar al ppio
        let item = todoList.todos[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
    //Para marcar o no una celda con el check
    override func tableView (_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){ //didSelectRowAt salta cuando seleccionamos una celda
        if let cell = tableView.cellForRow (at: indexPath){
            let item = todoList.todos[indexPath.row]
            configureText(for: cell, with: item) //Funcion que permite anadir el texto
            configureCheckmark(for: cell, with: item)//Funcion para marcar y desmarcar el objeto de la lista
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    //Delete items
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        todoList.todos.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        //tableView.reloadData()
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem){
        if let label = cell.viewWithTag(1000) as? UILabel{
            //Anadir las etiquetas en las celdas
            label.text = item.text
        }
    }
    
    //Marcar o desmarcar con un clic la celda seleccionada
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem){
        let isChecked = item.checked
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        //pone el check a la inversa
        item.toggleeChecked()
    }
}

