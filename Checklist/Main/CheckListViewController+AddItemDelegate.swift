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

extension ChecklistViewController: AddItemViewControllerDelegate{
    func addItemViewControllerDidCancel(_ controller: AddItemTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: AddItemTableViewController, didFinishAdding item: ChecklistItem) {
        navigationController?.popViewController(animated: true)
        //Anadir el item que se anade en add en la lista de todo
        let rowIndex = todoList.todos.count
        todoList.todos.append(item)
        let indexPath = IndexPath(row: rowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    
}
