//
//  ThirdVC.swift
//  lab4
//
//  Created by DA on 14/03/2023.
//

import UIKit

protocol MyDataSendingDelegateProtocol {
    func sendDataToFirstViewController(myData: String)
}

class ThirdVC: UIViewController {

    
    var delegate: MyDataSendingDelegateProtocol?
    
    var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        klasa.loadColor(frame: frame)
        textField.text = text
    }
    
    @IBOutlet var frame: UIView!
    @IBOutlet weak var textField: UITextField!
    let klasa = BackgroundLoadSave()
    
    @IBAction func zwrocButton(_ sender: Any) {
        if self.delegate != nil && self.textField.text != nil {
            let dataToBeSent = self.textField.text
            delegate?.sendDataToFirstViewController(myData: dataToBeSent!)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "thirdToSecond"{
            if let secondVC = segue.destination as? SecondVC,
                let writedText = textField.text {
                secondVC.text = writedText
            }
        }   
    }
}
