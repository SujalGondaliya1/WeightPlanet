//
//  PlanetSelect.swift
//  WeightPlanet
//
//  Created by SUJAL on 3/8/24.
//

import UIKit

@available(iOS 13.0, *)
class PlanetSelect: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_cal(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Calculator") as! Calculator
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btn_Convertor(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PlanetWeight") as! PlanetWeight
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btn_Info(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PlanetInfo") as! PlanetInfo
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btn_setting(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "WeightSetting") as! WeightSetting
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
