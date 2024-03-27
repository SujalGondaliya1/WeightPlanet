//
//  Calculator.swift
//  WeightPlanet
//
//  Created by SUJAL on 3/9/24.
//

import UIKit

class Calculator: UIViewController {

    @IBOutlet weak var lbl_remove_last: UIButton!
    @IBOutlet weak var lbl_sequence: UILabel!
    @IBOutlet weak var cornerView: UIView!
    @IBOutlet weak var lbl_display: UILabel!
    
    //MARK: Variables
    
    private var brain = CalVC()
    private var userIsInTheMiddleOfTyping = false
    
    
    private var displayValue: Double {
        get {
            return Double(lbl_display.text ?? Constants.emptyString) ?? Double.nan
        }
        set {
            let tmp = String(newValue).remove_Zero()
            lbl_display.text = tmp.setMaxLength(of: 8)
        }
    }
    
    @IBOutlet weak var clickBack: UIButton!
    
    @IBAction func clickBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onclickRemoveLast(_ sender: UIButton) {
        (self.lbl_sequence.text == "") ? self.lbl_display.text?.removeLast() : self.lbl_sequence.text?.removeLast()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cornerView.layer.cornerRadius = Constants.cornerRadius
        cornerView.layer.masksToBounds = true
    
    }
    
    //MARK: IBAction(s)
    
    @IBAction func touchDigit(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        if userIsInTheMiddleOfTyping {
            guard let textCurrentlyInDisplay = lbl_display.text else { return }
            if digit == "." && (textCurrentlyInDisplay.range(of: Constants.decimalPoint) != nil) {
                return
            } else {
                let tmp = textCurrentlyInDisplay + digit
                lbl_display.text = tmp.setMaxLength(of: Constants.maxStringLength)
            }
            
        } else {
            if digit == Constants.decimalPoint {
                lbl_display.text = Constants.pointAfterZero
            } else {
                lbl_display.text = digit
            }
            userIsInTheMiddleOfTyping = true
        }
        
        lbl_sequence.text = brain.description
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            print("User Type Oprands")
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        
        if let result = brain.result {
            displayValue = result
        }
        
        lbl_sequence.text = brain.description
    }

}

extension Calculator {
    struct Constants {
        static let cornerRadius: CGFloat = 35.0
        static let decimalPoint: String = "."
        static let emptyString: String = ""
        static let maxStringLength: Int = 8
        static let pointAfterZero: String = "0."
    }
}
