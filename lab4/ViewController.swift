//
//  ViewController.swift
//  lab4
//
//  Created by DA on 14/03/2023.
//

import UIKit

class ViewController: UIViewController, MyDataSendingDelegateProtocol {
    
    
    func sendDataToFirstViewController(myData: String) {
        secondTextField.text = myData
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        klasa.loadColor(frame: frame)
        let color = UserDefaults.standard.string(forKey: "backgroundColor")!
        switch color{
        case "white":
            segment.selectedSegmentIndex = 0
        case "gray":
            segment.selectedSegmentIndex = 1
        case "red":
            segment.selectedSegmentIndex = 2
        default:
            print("blad")
        }
        firstTextField.text = firstText
        secondTextField.text = secondText
    }
    
    
    let klasa = BackgroundLoadSave()
    
    var firstText = ""
    var secondText = ""
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var firstPageButton: UIButton!
    @IBOutlet weak var secondPageButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainFirst" {
            if let secondVC = segue.destination as? SecondVC,
                let writedText = firstTextField.text {
                secondVC.text = writedText
            }
        }
        if segue.identifier == "mainSecond" {
            if let thirdVC = segue.destination as? ThirdVC,
                let writedText = secondTextField.text {
                thirdVC.text = writedText
                thirdVC.delegate = self
            }
        }
    }

    @IBOutlet var frame: UIView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBAction func zmienKolorButtonClick(_ sender: Any) {

        let colorInd = segment.selectedSegmentIndex
        switch colorInd{
        case 0:
            frame.backgroundColor = UIColor.white
        case 1:
            frame.backgroundColor = UIColor.systemGray
        case 2:
            frame.backgroundColor = UIColor.systemRed
        default:
            print("blad")
        }
        klasa.saveColor(ind: colorInd)
    }
    
    @IBAction func infoButtonClick(_ sender: Any) {
        let alert = UIAlertController(title: "Popup", message: "Text", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

	
