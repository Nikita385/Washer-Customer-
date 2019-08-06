//
//  SignInController.swift
//  Washer
//
//  Created by Excelsior Technologies on 05/08/19.
//  Copyright © 2019 Excelsior Technologies. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import FirebaseAuth
import FirebaseCore
import Firebase
import UserNotifications
import RMMapper

class SignInController: BaseController {
    @IBOutlet weak var view_phoneNo: UIView!
    @IBOutlet weak var view_contryCode: UIView!
    
    @IBOutlet weak var txt_MoNo: TextFieldValidator!
    @IBOutlet weak var txt_countryCode: TextFieldValidator!
    @IBOutlet weak var btn_next: UIButton!
    @IBOutlet weak var btn_Inquiry: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn_next.applyRadiusBorder(radius: 5.0, borderWidth: 1.0, borderColor: .white)
        view_phoneNo.applyRadiusBorder(radius: 5.0, borderWidth: 0.0, borderColor: .clear)
        view_contryCode.applyRadiusBorder(radius: 5.0, borderWidth: 0.0, borderColor: .clear)
        IQKeyboardManager.shared.enabledToolbarClasses.append(SignInController.self)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tap_next(_ sender: Any) {
        apiLogin()
//        Constants.APP_DELEGATE.setHomeController()
//        if (txt_MoNo?.validate())! && (txt_countryCode?.validate())!
//        {
//            let mobileNo = txt_countryCode.text! + txt_MoNo.text!
//
//
//            PhoneAuthProvider.provider().verifyPhoneNumber(mobileNo, uiDelegate: nil) { (verificationID, error) in
//
//                if let error = error
//                {
//                    print(error)
//                    //APPDEL.window?.makeToast("Your mobile number is not valid")
//                    print("Your mobile number is not valid")
//                    coalition_t(truncating: false)
//                    return
//                }
//                else
//                {
//                    Singleton.sharedInstance.mobileNo = self.txt_countryCode.text! + self.txt_MoNo.text!
//                  Constants.APP_DELEGATE.setOTPVerificationController()
//                }
//                UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
//                coalition_t(truncating: true)
//                // Sign in using the verificationID and the code sent to the user
//            }
//
//        }
    }
    func apiLogin(){
        let parameters = [
            "MobileNumber" : self.txt_MoNo.text!,
            "DeviceName":   UIDevice.current.name,
            "DeviceToken": Singleton.sharedInstance.deviceToken,
            "DeviceType": "I"
        ]

        self.showNormalHud(NSLocalizedString("Please Wait...", comment: ""))
        
        UserBase.signUpUser(urlPath: BASE_URL+USER_LOGIN, parameters: parameters, completionHandler: { (user) in
            self.removeNormalHud()

//            if (user.user?.Status == "S")
//            {
//                Constants.APP_DELEGATE.setHomeController()
//                return
//            }
            Singleton.sharedInstance.userData = user.user
            Constants.USER_DEFAULTS.rm_setCustomObject(  Singleton.sharedInstance.userData, forKey: "userDetail")
            
            UserDefaults.standard.set((self.txt_countryCode.text)! + self.txt_MoNo.text!, forKey: "phone")
            UserDefaults.standard.synchronize()
            
            if (user.user?.Status == "S")
            {
                    Constants.APP_DELEGATE.setHomeController()
                    return
            }

        }) { (error) in
            self.removeNormalHud()
            self.view.makeToast("Server is not responding", duration: 1, position: .center)
        }
        
    }
    @IBAction func tap_inquiry(_ sender: Any) {
    }
}

