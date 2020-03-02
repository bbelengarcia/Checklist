//
//  AddItemTableViewController.swift
//  Checklist
//
//  Created by Belen Garcia Muñoz on 02/03/2020.
//  Copyright © 2020 Belen Garcia Muñoz. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate {
    func addItemViewControllerDidCancel(_ controller: AddItemTableViewController)
    func addItemViewController(_  controller: AddItemTableViewController, didFinishAdding item: ChecklistItem)
}

//Clase utilizada para cuando pulsas el + en la pantalla ppial

class AddItemTableViewController: UITableViewController {
    
    var delegate: AddItemViewControllerDelegate?
    
    //Referencias a los objetos del storyboard
    //Debe existir la referencia si no dara error (!), es decir el valor del atributo no puede ser nil
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    
    //Cancel button
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    //Add button
    @IBAction func done(_ sender: Any) {
        //Comprueba que el valor no es nulo
        navigationController?.popViewController(animated: true)
        //textField.text es el contenido del texto libre que anadimos en la interfaz
        let item = ChecklistItem()
        if let textFieldText = textField.text {
            item.text = textFieldText
        }
        item.checked = false
        delegate?.addItemViewController(self, didFinishAdding: item)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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


/*
extension ChecklistViewController: AddItemViewControllerDelegate {
    func addItemViewControllerDidCancel(_ controller: AddItemTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    func addItemViewController(_ controller: AddItemTableViewController, didFinishAdding item: ChecklistItem) {
        navigationController?.popViewController(animated: true)
    }
}
 
 */
