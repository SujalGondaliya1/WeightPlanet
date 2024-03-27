//
//  PlanetWeight.swift
//  WeightPlanet
//
//  Created by SUJAL on 3/8/24.
//

import UIKit

@available(iOS 13.0, *)
class PlanetWeight: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_moon(_ sender: Any) {
        navigateToWeightConvert(planet: "Moon", gravityFactor: 0.167)
    }
    @IBAction func btn_mercury(_ sender: Any) {
        navigateToWeightConvert(planet: "Mercury", gravityFactor: 0.38)
    }
    @IBAction func btn_venus(_ sender: Any) {
        navigateToWeightConvert(planet: "Venus", gravityFactor: 0.91)
    }
    @IBAction func btn_mars(_ sender: Any) {
        navigateToWeightConvert(planet: "Mars", gravityFactor: 0.38)
    }
    @IBAction func btn_jupiter(_ sender: Any) {
        navigateToWeightConvert(planet: "Jupiter", gravityFactor: 2.34)
    }
    @IBAction func btn_saturn(_ sender: Any) {
        navigateToWeightConvert(planet: "Saturn", gravityFactor: 1.06)
    }
    @IBAction func btn_uranas(_ sender: Any) {
        navigateToWeightConvert(planet: "Uranas", gravityFactor: 1.12)
    }
    @IBAction func btn_neptune(_ sender: Any) {
        navigateToWeightConvert(planet: "Neptune", gravityFactor: 0.92)
    }
    @IBAction func btn_pluto(_ sender: Any) {
        navigateToWeightConvert(planet: "Pluto", gravityFactor: 0.06)
    }
    func navigateToWeightConvert(planet: String, gravityFactor: Double) {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           if let vc = storyboard.instantiateViewController(withIdentifier: "Weightconvert") as? Weightconvert {
               vc.planet_name = planet
               vc.gravityFactor = gravityFactor
               vc.other_planet = "\(planet) is"
               
               let transition = CATransition()
               transition.duration = 0.5
               transition.type = .push
               transition.subtype = .fromRight
               view.window?.layer.add(transition, forKey: kCATransition)
               
               self.navigationController?.pushViewController(vc, animated: false)
           }
       }
    
    @IBAction func btn_back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
