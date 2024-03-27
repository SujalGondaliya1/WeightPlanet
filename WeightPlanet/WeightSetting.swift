//
//  WeightSetting.swift
//  WeightPlanet
//
//  Created by SUJAL on 3/8/24.
//

import UIKit
import StoreKit

var BaseURL = ""
var AppName = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String

@available(iOS 13.0, *)
class WeightSetting: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btn_back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btn_aboutus(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PlanetAboutUs") as! PlanetAboutUs
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btn_share(_ sender: Any) {
        print("Tapped Share", AppName ?? "")
        guard let appName = AppName else { return }
        self.share(items: [appName, URL.init(string: BaseURL) as Any])

    }
    @available(iOS 14.0, *)
    @IBAction func btn_rate(_ sender: Any) {
        rateUs()
    }
    @available(iOS 14.0, *)
    func rateUs() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            DispatchQueue.main.async {
                SKStoreReviewController.requestReview(in: scene)
            }
        } else {
            print(" - - - - - - Rating view in not present - - - -")
        }
    }
    
    
}

extension UIViewController {
    
    //  Share Items
    func share(items : [Any]) {
        //        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        //        activityController.setValue("Test", forKey: "Subject")
        //        self.present(activityController, animated: true, completion: nil)
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = self.view
        self.present(activityController, animated: true, completion: nil)
    }
}
