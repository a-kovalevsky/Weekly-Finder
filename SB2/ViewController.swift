//
//  ViewController.swift
//  SB2
//
//  Created by andrew on 6.04.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func findDay(_ sender: UIButton) {
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text, Int(day)! <= 31,Int(month)! <= 12, Int(year)! <= 2023 else {return}
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormat = DateFormatter ()
        dateFormat.locale = Locale(identifier: "ru_RU")
        dateFormat.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else {return}
        
        let weekday = dateFormat.string(from: date)
        let capitalizeWeekday = weekday.capitalized
        resultLabel.text = "\(capitalizeWeekday)"
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

