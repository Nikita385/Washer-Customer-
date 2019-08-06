//
//  OTPController.swift
//  Washer
//
//  Created by Excelsior Technologies on 05/08/19.
//  Copyright © 2019 Excelsior Technologies. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import PinCodeTextField
import FirebaseAuth
import FirebaseCore
import Firebase
import UserNotifications

class OTPController: UIViewController {
    @IBOutlet weak var btn_login: UIButton!
    @IBOutlet weak var btn_back: UIButton!
    @IBOutlet weak var txt_OTPField: PinCodeTextField!
    @IBOutlet weak var lbl_MoNo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        btn_login.applyRadiusBorder(radius: 5.0, borderWidth: 1.0, borderColor: .white)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tap_LoginBtn(_ sender: Any) {
        let credentials : PhoneAuthCredential = PhoneAuthProvider.provider().credential(withVerificationID: UserDefaults.standard.value(forKey: "authVerificationID") as! String, verificationCode: txt_OTPField.text!)
        Auth.auth().signIn(with: credentials) { (user, error) in
            if (error != nil)
            {
                print(error.debugDescription)
//                self.view.makeToast("Invalid OTP Please Resend it.")
            }
            else
            {
                
            }
      }
    }
//    func api_Login() {
//        let ws = Webservice()
//        let urlWeb = NSString.init(format: "%@,%@", Constants.BaseURL,Constants.login)
//        let parameterDic = [
//            "MobileNumber": Singleton.sharedInstance.mobileNo,
//            "DeviceName":   Singleton.sharedInstance.deviceToken,
//            "DeviceToken": Singleton.sharedInstance.deviceToken,
//            "DeviceType": "I"
//            ] as [String : Any]
//        ws.RequestForPost(url: urlWeb as String, postData: parameterDic, completionHandler: { (response) in
//            print("response complition",response)
//        }, errorCompletionHandler: { (error) in
//            print("response complition error",error.localizedDescription)
//        }) { (response) in
//            print("response complition fail",response)
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
