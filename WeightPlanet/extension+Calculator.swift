//
//  extension.swift
//  WeightPlanet
//
//  Created by SUJAL on 3/8/24.
//

import Foundation
import UIKit

extension UIView  {
    // MARK: - cornerRadius -
    @IBInspectable var cornerRadius : CGFloat{
        
        get{return self.cornerRadius}
        set{self.layer.cornerRadius = newValue}
    }
    
    // MARK: - cornerRadius like a Capsul -
    @IBInspectable var makeACapsul : CGFloat{
        
        get{return self.makeACapsul}
        set{self.layer.cornerRadius = self.frame.height /  newValue}
    }
}

struct CalVC {
    
    //MARK: Variables
    
    private var accumulator: Double?
    private var BinaryOperation: PendingBinaryOperation?
    private var result_Pending = false
    
    var description = ""
    var result: Double? { get { return accumulator } }
    
    //MARK: Enumerations
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case result
    }
    
    private var operations: Dictionary<String, Operation> = [
        "＋" : .binaryOperation({ $0 + $1 }),
        "﹣" : .binaryOperation({ $0 - $1 }),
         "×" : .binaryOperation({ $0 * $1 }),
         "÷" : .binaryOperation({ $0 / $1 }),
         "√" : .unaryOperation({ sqrt($0) }),
         "±" : .unaryOperation({ -$0 }),
         "﹪" : .unaryOperation({ $0 / 100 }),
         "AC": .constant(0),
         "=" : .result
    ]
    
    //MARK: Embedded struct

    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    //MARK: Functions
    
    private mutating func performPendingBinaryOperation() {
        if BinaryOperation != nil && accumulator != nil {
            accumulator = BinaryOperation?.perform(with: accumulator!)
            BinaryOperation = nil
            result_Pending = false
        }
    }
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            print(operation)
            switch operation {
                case .constant(let value):
                    accumulator = value
                    description = ""
                case .unaryOperation(let function):
                    if accumulator != nil {
                        let value = String(describing: accumulator!).remove_Zero()
                        description = symbol + "(" + value.setMaxLength(of: 5) + ")" + "="
                        accumulator = function(accumulator!)
                    }
                case .binaryOperation(let function):
                    performPendingBinaryOperation()
                    
                    if accumulator != nil {
                        if description.last == "=" {
                            description = String(describing: accumulator!).remove_Zero().setMaxLength(of: 5) + symbol
                        } else {
                            description += symbol
                        }
                        
                        BinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                        result_Pending = true
                        accumulator = nil
                    }
                case .result:
                    performPendingBinaryOperation()
                    
                    if !result_Pending {
                        description += " "
                    }
            }
        }
    }
    
    mutating func setOperand(_ operand: Double?) {
        accumulator = operand ?? 0.0
        if !result_Pending {
            description = String(describing: operand!).remove_Zero().setMaxLength(of: 5)
        } else {
            description += String(describing: operand!).remove_Zero().setMaxLength(of: 5)
        }
    }
}


public extension String {
   
   func setMaxLength(of maxLength: Int) -> String {
       var tmp = self
       
       if tmp.count > maxLength {
           var numbers = tmp.map({$0})
           
           if numbers[maxLength - 1] == "." {
               numbers.removeSubrange(maxLength+1..<numbers.endIndex)
           } else {
               numbers.removeSubrange(maxLength..<numbers.endIndex)
           }
           
           tmp = String(numbers)
       }
       return tmp
   }
   
   func remove_Zero() -> String {
       let token = self.components(separatedBy: ".")
       
       if !token.isEmpty && token.count == 2 {
           switch token[1] {
           case "0", "00", "000", "0000", "00000", "000000":
               return token[0]
           default:
               return self
           }
       }
       return self
   }
}
