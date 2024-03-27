//
//  Weightconvertor.swift
//  WeightPlanet
//
//  Created by SUJAL on 3/8/24.
//

import UIKit

class Weightconvertor: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
        @IBAction func btn_start(_ sender: Any) {
            if #available(iOS 13.0, *) {
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PlanetSelect") as! PlanetSelect
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                // Fallback on earlier versions
            }
            
        }
}
