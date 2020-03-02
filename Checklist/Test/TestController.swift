//
//  TestController.swift
//  Checklist
//
//  Created by Belen Garcia Muñoz on 02/03/2020.
//  Copyright © 2020 Belen Garcia Muñoz. All rights reserved.
//

import UIKit

class TestController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelLeadingConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Se ha creado una referencia a la constraint que permite que se cambie el valor dependiendo de la orientacion de la pantalla
        if UIDevice.current.orientation.isPortrait{
            labelLeadingConstraint.constant = 20
        }else{
            labelLeadingConstraint.constant = 200
        }
    }

}
