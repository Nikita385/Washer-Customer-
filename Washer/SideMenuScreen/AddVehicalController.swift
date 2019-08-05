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
    
    
    @IBAction func onBtnBlackClicked(_ sender: UIButton)
    {
        if sender == btnBlack {
            btnBlack.isSelected = true
            sender.setImage(UIImage(named: "whitear.png"), for: .normal)
            btnWhite.setImage(UIImage(named: ""), for: .normal)
            btnBlue.setImage(UIImage(named: ""), for: .normal)
            btnBrown.setImage(UIImage(named: ""), for: .normal)
        }
        else
        {
            btnBlue.isSelected = false
            btnBrown.isSelected = false
            btnBrown.isSelected = false
            btnBlack.backgroundColor = UIColor.black
        }
    }
    
    @IBAction func onBtnWhiteClicked(_ sender: UIButton)
    {
        if sender == btnWhite {
            btnWhite.isSelected = true
            sender.setImage(UIImage(named: "whitear.png"), for: .normal)
            btnBlue.setImage(UIImage(named: ""), for: .normal)
            btnBlack.setImage(UIImage(named: ""), for: .normal)
            btnBrown.setImage(UIImage(named: ""), for: .normal)
        }
        else
        {
            btnBlack.isSelected = false
            btnBrown.isSelected = false
            btnBlue.isSelected = false
            btnWhite.backgroundColor = UIColor.white
        }
    }
    
    
    @IBAction func onBtnBlueClicked(_ sender: UIButton)
    {
        if sender == btnBlue {
            btnBlue.isSelected = true
            sender.setImage(UIImage(named: "whitear.png"), for: .normal)
            btnWhite.setImage(UIImage(named: ""), for: .normal)
            btnBlack.setImage(UIImage(named: ""), for: .normal)
            btnBrown.setImage(UIImage(named: ""), for: .normal)

        }
        else
        {
            btnBlack.isSelected = false
            btnBrown.isSelected = false
            btnWhite.isSelected = false
            btnBlue.backgroundColor = UIColor.blue
        }
    }
    
    
    
    @IBAction func onBtnBrownClicked(_ sender: UIButton)
    {
        if sender == btnBrown {
            btnBrown.isSelected = true
            sender.setImage(UIImage(named: "whitear.png"), for: .normal)
            btnWhite.setImage(UIImage(named: ""), for: .normal)
            btnBlack.setImage(UIImage(named: ""), for: .normal)
            btnBlue.setImage(UIImage(named: ""), for: .normal)
        }
        else
        {
            btnBlack.isSelected = false
            btnWhite.isSelected = false
            btnBlue.isSelected = false
            btnBrown.backgroundColor = UIColor.brown
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if textField == txtPin1 {
//            let maxLength = 2
//            let currentString: NSString = textField.text! as NSString
//            let newString: NSString =
//                currentString.replacingCharacters(in: range, with: string) as NSString
//            return newString.length <= maxLength
//        }
//        else if textField == txtPin2 {
//            let maxLength = 2
//            let currentString: NSString = textField.text! as NSString
//            let newString: NSString =
//                currentString.replacingCharacters(in: range, with: string) as NSString
//            return newString.length <= maxLength
//        }
//        else if textField == txtPin3 {
//            let maxLength = 2
//            let currentString: NSString = textField.text! as NSString
//            let newString: NSString =
//                currentString.replacingCharacters(in: range, with: string) as NSString
//            return newString.length <= maxLength
//        }
//        else if textField == txtPin4 {
//            let maxLength = 4
//            let currentString: NSString = textField.text! as NSString
//            let newString: NSString =
//                currentString.replacingCharacters(in: range, with: string) as NSString
//            return newString.length <= maxLength
//        }
        
        let text=textField.text
        let currentString: NSString = textField.text! as NSString
        let counter = textField.text?.count
        
        if counter! == 1 {
            
            if textField == txtPin1{
                txtPin1.resignFirstResponder()
                txtPin2.becomeFirstResponder()
                
            } else if textField == txtPin2{
                txtPin2.resignFirstResponder()
                txtPin3.becomeFirstResponder()
                
            } else if textField == txtPin3{
                txtPin3.resignFirstResponder()
                txtPin4.becomeFirstResponder()
                
            }
            
        }else if counter! == 4
        {
            txtPin4.resignFirstResponder()
        }
        

        return true
    }
}
