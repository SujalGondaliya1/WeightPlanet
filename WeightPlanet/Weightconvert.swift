//
//  Weightconvert.swift
//  WeightPlanet
//
//  Created by SUJAL on 3/8/24.
//

import UIKit

@available(iOS 13.0, *)
class Weightconvert: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txt_weight: UITextField!
    @IBOutlet weak var lbl_otherplanet: UILabel!
    @IBOutlet weak var lbl_weigthearth: UILabel!
    @IBOutlet weak var lbl_otherweigth: UILabel!
    @IBOutlet weak var lbl_planetname: UILabel!
    var your_weigth = ""
    var other_weigth = ""
    var other_planet = ""
    var planet_name = ""
    var gravityFactor: Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()

        self.txt_weight.keyboardType = .numberPad
        self.txt_weight.delegate = self
        self.lbl_weigthearth.text = your_weigth
        self.lbl_planetname.text = planet_name
        self.lbl_otherplanet.text = other_planet
        self.lbl_otherweigth.text = other_weigth
        
    }
    

    @IBAction func btn_back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btn_setting(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "WeightSetting") as! WeightSetting
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func btn_enter(_ sender: Any) {
        if let weight = Double(self.txt_weight.text ?? "") {
                   let convertedWeight = weight * gravityFactor
                   self.lbl_otherweigth.text = "\(String(format: "%.2f", convertedWeight)) Kg"
               }
        self.lbl_weigthearth.text = "\(self.txt_weight.text!) Kg"
        print("Your weight: \(self.your_weigth)")
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Allow backspace
        guard string != "" else {
            return true
        }
        
        // Allow only numeric characters
        let allowedCharacterSet = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacterSet.isSuperset(of: characterSet)
    }
}
