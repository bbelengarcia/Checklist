//
//  CheckListViewController+AddItemDelegate.swift
//  Checklist
//
//  Created by Belen Garcia Muñoz on 02/03/2020.
//  Copyright © 2020 Belen Garcia Muñoz. All rights reserved.
//

import Foundation

//navigationController - un objeto de controlador de navegación administra sus controladores de vista secundarios. Te permite volver a la primera pantalla
//popViewController - elimina el controlador de vista superior de la pila y convierte la nueva parte superior de la pila en el controlador de vista activo.

//El propósito principal del patrón de delegado es permitir que un objeto se comunique con su propietario de forma desacoplada

//Interfaz a la que accede el hijo (AddItem) para poder anadir un item. El padre solo le permite llamar a estos metodos

extension ChecklistViewController: AddItemViewControllerDelegate{
    
    func addItemViewControllerDidCancel(_ controller: AddItemTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: AddItemTableViewController, didFinishAdding item: ChecklistItem) {
        navigationController?.popViewController(animated: true)
        //Anadir el item que se anade en add en la lista de todo
        let rowIndex = todoList.todos.count - 1
        //todoList.todos.append(item)
        //Se anade una nueva fila en la tabla del controlador padre
        let indexPath = IndexPath(row: rowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    func addItemViewController(_ controller: AddItemTableViewController, didFinishEditing item: ChecklistItem) {
        if let index = todoList.todos.firstIndex(of: item){
            let indexPath = IndexPath(row:index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath){
                configureText(for: cell, with: item)
            }
        }
        navigationController?.popViewController(animated: true)
        
    }
    
}
