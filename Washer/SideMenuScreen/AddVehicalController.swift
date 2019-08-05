//
//  AddVehicalController.swift
//  Washer
//
//  Created by Excelsior Technologies on 02/08/19.
//  Copyright © 2019 Excelsior Technologies. All rights reserved.
//

import UIKit

class AddVehicalController: UIViewController,UITextFieldDelegate
{
    @IBOutlet weak var btnWhite: UIButton!
    @IBOutlet weak var btnBlack: UIButton!
    @IBOutlet weak var btnBlue: UIButton!
    @IBOutlet weak var btnBrown: UIButton!
    
    @IBOutlet weak var txtPin1: UITextField!
    @IBOutlet weak var txtPin2: UITextField!
    @IBOutlet weak var txtPin3: UITextField!
    @IBOutlet weak var txtPin4: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        btnWhite.applyRadiusBorder(radius: self.btnWhite.frame.width/2, borderWidth: 1, borderColor: .black)
        btnBlue.applyRadiusBorder(radius: self.btnBlue.frame.width/2, borderWidth: 1, borderColor: .black)
        btnBrown.applyRadiusBorder(radius: self.btnBrown.frame.width/2, borderWidth: 1, borderColor: .black)
        btnBlack.applyRadiusBorder(radius: self.btnBlack.frame.width/2, borderWidth: 1, borderColor: .black)
    
         txtPin1.delegate = self
         txtPin2.delegate = self
         txtPin3.delegate = self
         txtPin4.delegate = self

        // Do any additional setup after loading the view.
    }
    

    
    

    @IBAction func onRadioButtonClick(_ sender: UIButton)
    {
        if sender == btnBlack {
           
            btnBlack.setImage(UIImage(named: "trueSign"), for: UIControl.State.normal)

            btnBlue.setImage(nil, for: UIControl.State.normal)
            btnBrown.setImage(nil, for: UIControl.State.normal)
            btnWhite.setImage(nil, for: UIControl.State.normal)
            btnBlack.isSelected = true;
            
        }else if sender == btnWhite{
           
            btnWhite.setImage(UIImage(named: "trueSign"), for: UIControl.State.normal)
            
            btnBlack.setImage(nil, for: UIControl.State.normal)
            btnBrown.setImage(nil, for: UIControl.State.normal)
            btnBlue.setImage(nil, for: UIControl.State.normal)
            btnWhite.isSelected = true;
            
        }else if sender == btnBlue{
      
            btnBlue.setImage(UIImage(named: "trueSign"), for: UIControl.State.normal)
            btnBlack.setImage(nil, for: UIControl.State.normal)
            btnBrown.setImage(nil, for: UIControl.State.normal)
            btnWhite.setImage(nil, for: UIControl.State.normal)
            btnBlue.isSelected = true;
         
        }else if sender == btnBrown{
        
            btnBrown.setImage(UIImage(named: "trueSign"), for: UIControl.State.normal)
            btnBlack.setImage(nil, for: UIControl.State.normal)
            btnWhite.setImage(nil, for: UIControl.State.normal)
            btnBlue.setImage(nil, for: UIControl.State.normal)
            btnBrown.isSelected = true;
            
        }
    }


    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let text = textField.text
        let start = string.index(string.startIndex, offsetBy: range.location)
        let end = string.index(start, offsetBy: range.length)
        let indexRange = start..<end
       

        let result = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string

        let newLength = result.count
        
        if textField == txtPin1{
            if newLength == 2 {
                txtPin1.text = result
                txtPin2.becomeFirstResponder()
                return false
            }
        } else if textField == txtPin2{
            if newLength == 2 {
                txtPin2.text = result
                txtPin3.becomeFirstResponder()
                return false
            }
            
        } else if textField == txtPin3{
            if newLength == 2 {
                txtPin3.text = result
                txtPin4.becomeFirstResponder()
                return false
                
            }
        }
      
        return !(result.count>1)
     
    }
}
