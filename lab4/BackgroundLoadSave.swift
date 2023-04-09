//
//  BackgroundLoadSave.swift
//  lab4
//
//  Created by DA on 09/04/2023.
//

import UIKit

class BackgroundLoadSave: UIView {

    let defaults = UserDefaults.standard
    
    
    func saveColor(ind : Int) -> Void{
        
        switch ind{
        case 0:
            defaults.set("white", forKey: "backgroundColor")
        case 1:
            defaults.set("gray", forKey: "backgroundColor")
        case 2:
            defaults.set("red", forKey: "backgroundColor")
        default:
            print("blad")
        }
        
    }
    
    func loadColor(frame: UIView) -> Void{
        
        let color = defaults.string(forKey: "backgroundColor")!
        
        switch color{
        case "white":
            frame.backgroundColor = UIColor.white
        case "gray":
            frame.backgroundColor = UIColor.systemGray
        case "red":
            frame.backgroundColor = UIColor.systemRed
        default:
            print("blad")
        }
    }


}
