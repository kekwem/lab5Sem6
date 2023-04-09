//
//  SecondVC.swift
//  lab4
//
//  Created by DA on 14/03/2023.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        klasa.loadColor(frame: frame)
        textField.text = text
    }
    
    let klasa = BackgroundLoadSave()
    
    @IBOutlet var frame: UIView!
    var text: String!
    @IBOutlet weak var textField: UITextField!
}
