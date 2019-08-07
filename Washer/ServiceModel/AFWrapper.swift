//
//  AFWrapper.swift
//  MediaVoir
//



import UIKit
import Alamofire
import SwiftyJSON
import Toast_Swift
import EZAlertController



class AFWrapper: NSObject {
    
    class func requestGETURL(_ strURL: String,_ parameters:Parameters, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        
        ToastManager.shared.isQueueEnabled = false
        
        if Connectivity.isConnectedToInternet() {
            // print("Yes! internet is available.")
            Alamofire.request(strURL,parameters: parameters).responseJSON { (responseObject) -> Void in
                
                print(responseObject)
                
                if responseObject.result.isSuccess {
                    let resJson = JSON(responseObject.result.value!)
                    success(resJson)
                    //                if(resJson["Msg"] == "Success")
                    //                {
                    //                    success(resJson)
                    //                }
                    //                else
                    //                {
                    //                    let error : Error = responseObject.result.error!
                    //                    failure(error)
                    //                }
                }
                
                if responseObject.result.isFailure {
                    Constants.UIWINDOW?.makeToast("Internet Problem", duration: 1, position: .center)
                    let error : Error = responseObject.result.error!
                    failure(error)
                }
            }
        }else {
            //UIApplication.topViewController()?.view.makeToast("Internet Problem", duration: 1, position: .center)
            
            
            
            
            //Utility.showAlert(title: "", message: "Internet Problem")
        }
        
    }
    
    class func requestGETURLWithHeader(_ strURL: String,_ parameters:Parameters?,_ headers:[String:String], success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        
        
        ToastManager.shared.isQueueEnabled = false
        
        if Connectivity.isConnectedToInternet() {
            
            
            
            Alamofire.request(strURL,parameters: parameters,headers: headers).responseJSON { (responseObject) -> Void in
                
                print(responseObject)
                
                
                
                if responseObject.result.isSuccess {
                    let resJson = JSON(responseObject.result.value!)
                    
                    let ub = resJson["UserBlocked"].int
                    if ub == 1 {
                        if Singleton.sharedInstance.isBlockPopupShown == false {
                            Singleton.sharedInstance.isBlockPopupShown = true
                            EZAlertController.alert(NSLocalizedString("Alert", comment: ""), message: NSLocalizedString("You have been blocked please contact info@yummcloud.com", comment: ""), acceptMessage: NSLocalizedString("OK", comment: "")) {
                                
                                Constants.APP_DELEGATE.setLoginController()
                                return
                            }
                        }
                        
                    }else if ub == 2 {
                        
                        if Singleton.sharedInstance.isBlockPopupShown == false {
                            Singleton.sharedInstance.isBlockPopupShown = true
                            
                            EZAlertController.alert(NSLocalizedString("Alert", comment: ""), message: NSLocalizedString("Your account has been deleted by admin. Kindly Contact to admin! Thanks", comment: ""), acceptMessage: NSLocalizedString("OK", comment: "")) {
                                
                                Constants.APP_DELEGATE.setLoginController()
                                return
                            }
                        }
                        
                        
                    }else {
                        success(resJson)
                    }
                    
                    
                    
                    //                if(resJson["Msg"] == "Success")
                    //                {
                    //                    success(resJson)
                    //                }
                    //                else
                    //                {
                    //                    let error : Error = responseObject.result.error!
                    //                    failure(error)
                    //                }
                }
                
                if responseObject.result.isFailure {
                    Constants.UIWINDOW?.makeToast("Server is not responding", duration: 1, position: .center)
                    let error : Error = responseObject.result.error!
                    
                    failure(error)
                }
            }
        }else {
            
            
            //UIApplication.topViewController()?.view.makeToast("Internet Problem", duration: 1, position: .center)
        }
        
        
    }
    
    
    class func requestPOSTURL(_ strURL : String, params : Parameters, headers : [String : String]?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
        
        ToastManager.shared.isQueueEnabled = false
        
        if Connectivity.isConnectedToInternet() {
            print(params)
            
            
            Alamofire.request(strURL, method: .post, parameters: params,headers: headers)
                // Alamofire.request(strURL, method: .post, parameters: params, encoding: JSONEncoding.prettyPrinted, headers: headers)
                .responseJSON { (responseObject) -> Void in
                    print(responseObject)
                    
                    if responseObject.result.isSuccess {
                        let resJson = JSON(responseObject.result.value!)
                        
                        let ub = resJson["UserBlocked"].int
                        if ub == 1 {
                            if Singleton.sharedInstance.isBlockPopupShown == false {
                                Singleton.sharedInstance.isBlockPopupShown = true
                                EZAlertController.alert(NSLocalizedString("Alert", comment: ""), message: NSLocalizedString("You have been blocked please contact info@yummcloud.com", comment: ""), acceptMessage: NSLocalizedString("OK", comment: "")) {
                                    
                                    Constants.APP_DELEGATE.setLoginController()
                                    return
                                }
                            }
                           
                        }else if ub == 2 {
                            
                            if Singleton.sharedInstance.isBlockPopupShown == false {
                                Singleton.sharedInstance.isBlockPopupShown = true
                                EZAlertController.alert(NSLocalizedString("Alert", comment: ""), message: NSLocalizedString("Your account has been deleted by admin. Kindly Contact to admin! Thanks", comment: ""), acceptMessage: NSLocalizedString("OK", comment: "")) {
                                    
                                    Constants.APP_DELEGATE.setLoginController()
                                    return
                                }
                            }
                            
                        }else {
                            success(resJson)
                        }
                        
                    }
                    if responseObject.result.isFailure {
                        let error : Error = responseObject.result.error!
                        failure(error)
                    }
            }
            
        }else {
            //Constants.UIWINDOW?.makeToast("Server is not responding", duration: 1, position: .center)
            //UIApplication.topViewController()?.view.makeToast("Internet Problem", duration: 1, position: .center)
        }
        
    }
    
    class func requestPOSTWithSingleImage(_ strURL : String, parameters : Parameters,dataImage : [String:Any]? , headers : [String : String]?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
        //var dictionary = ["Item 1": "description", "Item 2": "description"]
        
        print(dataImage)
        let imageValue = dataImage?["value"] as! UIImage?
        let imageKey = dataImage?["key"] as! String?
        
        let URLSTR = try! URLRequest(url: strURL, method:.post,headers: headers)
        print(URLSTR)
        if Connectivity.isConnectedToInternet() {
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                // code
                
                if(imageValue != nil) {
                    let imageData = imageValue!.pngData()
                    multipartFormData.append(imageData!, withName: imageKey!, fileName: "image.png", mimeType: "image/png")
                }
                for (key, value) in parameters {
                    //multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                    multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                    
                    print(key)
                    print(value)
                }
            },
                             with: URLSTR, encodingCompletion: { (result) in
                                switch result {
                                case .success(let upload, _, _):
                                    upload.responseJSON { responseObject in
                                        debugPrint(responseObject)
                                        if responseObject.result.isSuccess {
                                            let resJson = JSON(responseObject.result.value!)
                                            success(resJson)
                                        }
                                        if responseObject.result.isFailure {
                                            let error : Error = responseObject.result.error!
                                            failure(error)
                                        }
                                        
                                    }
                                    
                                case .failure(let encodingError):
                                    //Constants.UIWINDOW?.makeToast("Server is not responding", duration: 1, position: .center)
                                    print(encodingError)
                                }
            })
            
            
            
        }else {
            //UIApplication.topViewController()?.view.makeToast("Internet Problem", duration: 1, position: .center)
        }
        
    }
    
    
    
    class func requestGETURLWithHeaderBackground(_ strURL: String,_ parameters:Parameters?,_ headers:[String:String], success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        
        let queue = DispatchQueue.global(qos: .background)
        
        Alamofire.request(strURL,parameters: parameters,headers: headers).responseJSON(queue: queue) { (responseObject) -> Void in
            
            print(responseObject)
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                
                let ub = resJson["UserBlocked"].int
                if ub == 1 {
                    
                    if Singleton.sharedInstance.isBlockPopupShown == false {
                        Singleton.sharedInstance.isBlockPopupShown = true
                        EZAlertController.alert(NSLocalizedString("Alert", comment: ""), message: NSLocalizedString("You have been blocked please contact info@yummcloud.com", comment: ""), acceptMessage: NSLocalizedString("OK", comment: "")) {
                            
                            Constants.APP_DELEGATE.setLoginController()
                            return
                        }
                    }
                    
                    
                    
                }else if ub == 2 {
                    if Singleton.sharedInstance.isBlockPopupShown == false {
                        Singleton.sharedInstance.isBlockPopupShown = true
                        EZAlertController.alert(NSLocalizedString("Alert", comment: ""), message: NSLocalizedString("Your account has been deleted by admin. Kindly Contact to admin! Thanks", comment: ""), acceptMessage: NSLocalizedString("OK", comment: "")) {
                            
                            Constants.APP_DELEGATE.setLoginController()
                            return
                        }
                    }
                    
                }else{
                    success(resJson)
                }
                
                
                
            }
            //MUHAMMADIMTIAZALI
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    
    class func requestPOSTURLCareem(_ strURL : String, params : Parameters, headers : [String : String]?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
        
        ToastManager.shared.isQueueEnabled = true
        
        if Connectivity.isConnectedToInternet() {
            print(params)
            
            
            //Alamofire.request(strURL, method: .post, parameters: params,headers: headers)
            let request = Alamofire.request(strURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers)
                .responseJSON { (responseObject) -> Void in
                    print(responseObject)
                    
                    if responseObject.result.isSuccess {
                        let resJson = JSON(responseObject.result.value!)
                        success(resJson)
                    }
                    if responseObject.result.isFailure {
                        let error : Error = responseObject.result.error!
                        failure(error)
                    }
            }
            print(request)
            
        }else {
            Constants.UIWINDOW?.makeToast("Server is not responding", duration: 1, position: .center)
            //UIApplication.topViewController()?.view.makeToast("Internet Problem", duration: 1, position: .center)
        }
        
    }
    
    
//    func blockUser(_ userBlocked:Int) {
//        
//        if userBlocked == 1 {
//            
//            EZAlertController.alert(NSLocalizedString("Alert", comment: ""), message: NSLocalizedString("You have  blocked by admin. Kindly Contact to admin! Thanks", comment: ""), acceptMessage: NSLocalizedString("OK", comment: "")) {
//                
//                Constants.APP_DELEGATE.setLoginController()
//            }
//        }else if userBlocked == 2 {
//            
//            EZAlertController.alert(NSLocalizedString("Alert", comment: ""), message: NSLocalizedString("Your account has been deleted by admin. Kindly Contact to admin! Thanks", comment: ""), acceptMessage: NSLocalizedString("OK", comment: "")) {
//                
//                Constants.APP_DELEGATE.setLoginController()
//            }
//        }
//        
//    }
    
}

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
