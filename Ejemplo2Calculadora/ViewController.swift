//
//  ViewController.swift
//  Ejemplo2Calculadora
//
//  Created by Leonel Pacehco on 6/1/15.
//  Copyright (c) 2015 Leonel Pacheco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var display : UILabel!
    
    var insertaNumero = false
    
    @IBAction func numeros (sender:UIButton)
    {
        let digito = sender.currentTitle!
        if (insertaNumero == true) {
            display.text = display.text! + digito
        }
        else{
            display.text = digito
            insertaNumero = true
        }
    }
    
    var operandStank = Array<Double>()
    
    @IBAction func enter (){
        insertaNumero = false
        operandStank.append(displayvalue)
        println("operandStack = \(operandStank)")
    }
    
    var displayvalue: Double {
        get{
            return NSNumberFormatter ().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            insertaNumero = false
        }
    }
    
    @IBAction func  clear(){
        displayvalue = 0
        display.text = "\(displayvalue)"
    }
    @IBAction func operate (sender: UIButton){
        let operation = sender.currentTitle!
        if insertaNumero {
            enter()
        }
        switch operation {
        case "➕":
            performOperation {$0 + $1}
        case "➖":
            performOperation {$1 - $0}
        case "✖️":
            performOperation {$0 + $1}
        case "➗":
            performOperation {$1 / $0}
        case "^":
            performOperation2 {sqrt($0)}
        default: break
        }
    }
    
        func performOperation (operation: (Double, Double) -> Double){
            if operandStank.count >= 2 {
                displayvalue = operation (operandStank.removeLast(), operandStank.removeLast())
                enter()
            }
        }
        
        func performOperation2 (operation: Double -> Double) {
            if (operandStank.count >= 1) {
                displayvalue = operation (operandStank.removeLast())
                enter()
            }
        }
        
    
    func add (op1: Double, op2: Double) -> Double{
        return op1 + op2
    }
    func mult (op1: Double, op2: Double) -> Double{
        return op1 * op2
    }
    func subtract (op1: Double, op2: Double) -> Double{
        return op1 - op2
    }
    func div (op1: Double, op2: Double) -> Double{
        return op1 / op2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

