//
//  AddItemTableViewController.swift
//  Checklist
//
//  Created by Belen Garcia Muñoz on 02/03/2020.
//  Copyright © 2020 Belen Garcia Muñoz. All rights reserved.
//

import UIKit

//Protocolo que debe seguir la interfaz, funciones que tiene que realizar
protocol AddItemViewControllerDelegate {
    func addItemViewControllerDidCancel(_ controller: AddItemTableViewController)
    func addItemViewController(_  controller: AddItemTableViewController, didFinishAdding item: ChecklistItem)
    func addItemViewController(_ controller: AddItemTableViewController, didFinishEditing item: ChecklistItem)
}

//Clase utilizada para cuando pulsas el + en la pantalla ppial

class AddItemTableViewController: UITableViewController {
    
    //Estos objetos SI pueden ser nulables
    //Permite el acceso a la interfaz del padre 
    var delegate: AddItemViewControllerDelegate?
    weak var todoList: TodoList?
    weak var itemToEdit: ChecklistItem?
    
    //Referencias a los objetos del storyboard
    //Debe existir la referencia si no dara error (!), es decir el valor del atributo no puede ser nil (estos objetos NO son nulables)
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    
    //Cancel button
    @IBAction func cancel(_ sender: Any) {
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    //Add button
    @IBAction func done(_ sender: Any) {
        //Si las constantes no son nulas
        if let item = itemToEdit, let text = textField.text{
            item.text = text
            delegate?.addItemViewController(self, didFinishEditing: item)
        } else {
            //textField.text es el contenido del texto libre que anadimos en la interfaz
            if let item = todoList?.newTodo(){
                if let textFieldText = textField.text {
                    item.text = textFieldText
                }
                item.checked = false
                delegate?.addItemViewController(self, didFinishAdding: item)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Check si hay un item editandose
        //Cambiamos el titulo de la pagina y se pasa el texto a la linea de texto libre
        if let item = itemToEdit{
            title = "Edit Item"
            textField.text = item.text
            addBarButton.isEnabled = true
        }
        navigationItem.largeTitleDisplayMode = .never
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //El usuario no tiene que pulsar en textField para editar, si no que viene como para poder editar con esta opcion
        textField.becomeFirstResponder()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
}

//TextField protocol
extension AddItemTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //Check si hay texto en el textField
        guard let oldText = textField.text, let stringRange = Range(range, in: oldText) else { return false }
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            addBarButton.isEnabled = false
        } else {
            addBarButton.isEnabled = true
        }
        return true
    }
}

