//
//  ProfileController.swift
//  Washer
//
//  Created by Excelsior Technologies on 01/08/19.
//  Copyright © 2019 Excelsior Technologies. All rights reserved.
//

import UIKit
import Alamofire
import EZAlertController
import SwiftyJSON
import UserNotifications
import RMMapper

class ProfileController: BaseController
{
    
    @IBOutlet weak var tfusername: UITextField!
    @IBOutlet weak var tfmobileno: UITextField!
    @IBOutlet weak var tfemail: UITextField!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMobno: UILabel!
    @IBOutlet weak var lblVehical: UILabel!
    @IBOutlet weak var lblOrder: UILabel!
    @IBOutlet weak var lblPackage: UILabel!
    @IBOutlet weak var lblprize: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apigetProfile()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
      
   
        
    }
    @IBAction func tap_SideMenu(_ sender: Any) {
        sideMenuController?.revealMenu()
    }
    func apigetProfile(){
        var parameter:Parameters!
        parameter = ["RegisterId":  Singleton.sharedInstance.userData.RegisterId!]
        self.showNormalHud(NSLocalizedString("Please Wait...", comment: ""))
        
        ProfileBase.getProfile(urlPath: BASE_URL+GET_PROFILE, parameters: parameter, completionHandler: { (user) in
            self.removeNormalHud()
            
            Singleton.sharedInstance.profileData = user.profile
            Constants.USER_DEFAULTS.rm_setCustomObject(  Singleton.sharedInstance.profileData, forKey: "profileDetail")
            
            
            
            if (user.status == "True")
            {
                let profileModel = Constants.USER_DEFAULTS.rm_customObject(forKey: "profileDetail") as? ProfileDetail
                self.tfusername.text = profileModel!.FullName
            }
            
        }) { (error) in
            self.removeNormalHud()
            self.view.makeToast("Server is not responding", duration: 1, position: .center)
        }
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
