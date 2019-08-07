//
//  BaseController.swift
//  Template
//


import UIKit
import JGProgressHUD
import PopupDialog
import Toast_Swift
var kSomeKey = "s"
var kIndex = "s"

class BaseController: UIViewController {

    //var popUpController:PopUpController!
    var HUD:JGProgressHUD! = nil
    var viewSearchBar: UIView!
//    var currentController: Controllers!
    var lblTitle: UILabel!
    var txtSearch: UITextField?
    let userDefault = UserDefaults.standard
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        UIApplication.shared.statusBarStyle = .default
//        self.navigationController?.navigationBar.tintColor = AppConstants.NavigationColor
//        UIApplication.shared.statusBarStyle = .lightContent
//
//        if (currentController == Controllers.splash) {
//            
//        }
//        else if (currentController == Controllers.language) {
//            UIApplication.shared.statusBarStyle = .default
//        }
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (lblTitle == nil) {
            //print(self.navigationController?.navigationBar.subviews)
//            lblTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: (self.navigationController?.navigationBar.frame.size.height)!))
//            lblTitle.textAlignment = NSTextAlignment.center
//            //lblTitle.text = "Test"
//            lblTitle.font = UIFont (name: "Roboto-Regular", size: 18)
//            lblTitle.textColor = UIColor.white
//            lblTitle.tag = 10
//            self.navigationController?.navigationBar.addSubview(lblTitle)
            
        }

//        if (currentController == Controllers.splash) {
//            
//        }
//        else if (currentController == Controllers.language) {
//            
//        }
//        else if (currentController == Controllers.welcome) {
//            
//        }else if (currentController == Controllers.adddish) {
//            createBackarrow()
//            createRightShare()
//        } else if (currentController == Controllers.search) {
//            createBackarrow()
//        } else if (currentController == Controllers.editProfile) {
//            createBackarrow()
//        } else if (currentController == Controllers.home) {
//            
//            //createBackarrow()
//            
//        
//        } else if (currentController == Controllers.foodDetailOrder){
//            createBackarrow()
//        }else if (currentController == Controllers.addfoodfromcart) {
//            createBackarrow()
//        }
//        else if(currentController == Controllers.otherProfile) {
//            createBackarrow()
//            createRightShare()
//        } else if( currentController == Controllers.cart ){
//            createBackarrow()
//        } else if currentController == Controllers.setting {
//            createBackarrow()
//        }else if currentController == Controllers.notifications {
//            createBackarrow()
//        }else if currentController == Controllers.orderDetail {
//            createBackarrow()
//        }
//        else if currentController == Controllers.viewOrders {
//            createBackarrow()
//        }
//        else if currentController == Controllers.notificationController {
//            createBackarrow()
//        } //else if currentController == Controllers.notificationController {
          //  createBackarrow()
       // }
    }
    
    func homeRightMenu(){
        
        
        let imgAdd: UIImage = UIImage(named: "add-top")!
        let btnAdd: UIButton = UIButton(type: .custom)
        btnAdd.bounds = CGRect(x: 0, y: 0, width: imgAdd.size.width, height: imgAdd.size.height)
        btnAdd.setImage(imgAdd, for: UIControl.State())
        btnAdd.addTarget(self, action: #selector(BaseController.newMessageScreen), for: .touchUpInside)
        let btnAddItem: UIBarButtonItem = UIBarButtonItem(customView: btnAdd)
        self.navigationItem.rightBarButtonItem = btnAddItem
        
    
    }
    
    func commentListButtons() {
        
        let imgAdd: UIImage = UIImage(named: "add-top")!
        let btnAdd: UIButton = UIButton(type: .custom)
        btnAdd.bounds = CGRect(x: 0, y: 0, width: imgAdd.size.width, height: imgAdd.size.height)
        btnAdd.setImage(imgAdd, for: UIControl.State())
        btnAdd.addTarget(self, action: #selector(BaseController.newMessageScreen), for: .touchUpInside)
        let btnAddItem: UIBarButtonItem = UIBarButtonItem(customView: btnAdd)
        self.navigationItem.rightBarButtonItem = btnAddItem
    }
    
    func createBackarrow()  {
        
        let imgBack: UIImage = UIImage(named: "back")!
        let btnBack: UIButton = UIButton(type: .custom)
        btnBack.bounds = CGRect(x: -10, y: 0, width: imgBack.size.width+20, height: imgBack.size.height+20)
        btnBack.setImage(imgBack, for: UIControl.State())
        btnBack.addTarget(self, action: #selector(BaseController.popViewController), for: .touchUpInside)
        let btnBackItem: UIBarButtonItem = UIBarButtonItem(customView: btnBack)
        
        self.navigationItem.leftBarButtonItem = btnBackItem
    }
    
    func createHomeButtons() {
        
        let imgSearch: UIImage = UIImage(named: "search-icon")!
        let btnSearch: UIButton = UIButton(type: .custom)
        btnSearch.bounds = CGRect(x: 0, y: 0, width: imgSearch.size.width, height: imgSearch.size.height)
        btnSearch.setImage(imgSearch, for: UIControl.State())
       // btnSearch.addTarget(self, action: #selector(BaseController.searchScreen), for: .touchUpInside)
        let btnSearchItem: UIBarButtonItem = UIBarButtonItem(customView: btnSearch)
        self.navigationItem.leftBarButtonItem = btnSearchItem
        
        let imgComment: UIImage = UIImage(named: "comment-icon-top")!
        let btnComment: UIButton = UIButton(type: .custom)
        btnComment.bounds = CGRect(x: 0, y: 0, width: imgComment.size.width+20, height: imgComment.size.height)
        btnComment.setImage(imgComment, for: UIControl.State())
       // btnComment.addTarget(self, action: #selector(BaseController.showCommentListing), for: .touchUpInside)
        let btnCommentItem: UIBarButtonItem = UIBarButtonItem(customView: btnComment)
        
        let imgNotification: UIImage = UIImage(named: "notification-icon")!
        let btnNotification: UIButton = UIButton(type: .custom)
        btnNotification.bounds = CGRect(x: 0, y: 0, width: imgNotification.size.width+20, height: imgNotification.size.height)
        btnNotification.setImage(imgNotification, for: UIControl.State())
        btnNotification.addTarget(self, action: #selector(BaseController.showNotificationController), for: .touchUpInside)
        let btnNotificationItem: UIBarButtonItem = UIBarButtonItem(customView: btnNotification)

        self.navigationItem.rightBarButtonItems = [btnNotificationItem,btnCommentItem]
    }
    
//    func createRightShare()  {
//
//        if self is FoodCuisineController || self is ProfileViewController {
//            let imgBack: UIImage = UIImage(named: "share")!
//            let btnBack: UIButton = UIButton(type: .custom)
//            btnBack.bounds = CGRect(x: 0, y: 0, width: imgBack.size.width+20, height: imgBack.size.height+20)
//            btnBack.setImage(imgBack, for: UIControl.State())
//            btnBack.addTarget(self, action: #selector(BaseController.shareSmallLink), for: .touchUpInside)
//            let btnBackItem: UIBarButtonItem = UIBarButtonItem(customView: btnBack)
//
//            self.navigationItem.rightBarButtonItem = btnBackItem
//        }
//
//    }

//    @objc func shareLink() {
//
//        let app_code = "yummcloud"
//        let project_id = "1361517380"
//        var your_deep_link = "http://yummcloud.com/api/"
//        var image_url: UIImage? = nil
//
//        if self is FoodCuisineController {
//
//            let controller = self as! FoodCuisineController
//
//            let url = URL(string: controller.data.imageUrl!)
//            let data = try? Data(contentsOf: url!)
//            if data != nil {
//                image_url = UIImage(data: data!)
//            }
//
//            let id = String(format: "%d", controller.data.id!)
//            your_deep_link = your_deep_link + "get-food?id=" + id
//
//        } else if self is ProfileViewController {
//
//            let controller = self as! ProfileViewController
//
//            let url = URL(string: controller.chefData.profileImage!)
//            let data = try? Data(contentsOf: url!)
//            if data != nil {
//                image_url = UIImage(data: data!)
//            }
//
//            let id = String(format: "%d", controller.chefId)
//            your_deep_link = your_deep_link + "get-chef?id=" + id
//        }
//
//        let package_name_android = "com.ingic.cloudmadefood"
//        let package_name = "com.app.yummcloud"
//        let minimum_version = "1.0.0.0"
//        let fallback_link = "https://www.yummcloud.com/"
//        let dynamicLink = "https://" + app_code + ".app.goo.gl/?link=" + your_deep_link + "&apn=" + package_name_android + "&ibi=" + package_name + "&isi=" + project_id + "&amv=" + minimum_version + "&ofl=" + fallback_link
//
//        print(dynamicLink)
//
//        createShortLink(longLink: dynamicLink, imageURL: image_url)
//
//    }

//    func createShortLink(longLink: String, imageURL: UIImage?) {
//
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        var request = URLRequest(url: URL(string: "https://firebasedynamiclinks.googleapis.com/v1/shortLinks?key=" + appDelegate.firebaseKey)!)
//        request.httpMethod = "POST"
//        //let params = ["longDynamicLink": longLink, "suffix":["option": "SHORT"]] as [String : Any]
//        let params = ["longDynamicLink": longLink]
//
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
//        request.httpShouldHandleCookies = false
//        request.timeoutInterval = 8.0
//
//        let jsonData = try! JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.prettyPrinted)
//        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
//
//        print(jsonString as Any)
//
//        //request.httpBody = jsonData
//        request.httpBody = jsonString!.data(using: String.Encoding.utf8.rawValue);
//
//        let session = URLSession(configuration: URLSessionConfiguration.default)
//
//        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
//
//            if error != nil {
//                self.shareSmallLink(link: longLink, imageURL: imageURL)
//            }
//
//            if let resposeData:Data = data {
//
//                do {
//
//                    if let responseObject = try JSONSerialization.jsonObject(with: resposeData, options: .mutableContainers) as? NSDictionary {
//
//                        let shortLink = responseObject["shortLink"] as? String
//
//                        if shortLink == nil {
//                            self.shareSmallLink(link: longLink, imageURL: imageURL)
//                        } else {
//                            print(shortLink as Any)
//                            self.shareSmallLink(link: shortLink!, imageURL: imageURL)
//                        }
//
//                    }
//
//                } catch let error {
//                    print(error.localizedDescription)
//                    self.shareSmallLink(link: longLink, imageURL: imageURL)
//                }
//
//            } else {
//                self.shareSmallLink(link: longLink, imageURL: imageURL)
//            }
//
//        })
//
//        task.resume()
//
//    }
    
    @objc func shareSmallLink(link: String, imageURL: UIImage?) {
    
        var bodyLink = [Any]()

        if imageURL != nil {
            bodyLink.append(imageURL as Any)
        }

        bodyLink.append(link)

        let activityVC = UIActivityViewController(activityItems: bodyLink, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.print, UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.assignToContact, UIActivity.ActivityType.saveToCameraRoll, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.message, UIActivity.ActivityType.mail, UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToVimeo, UIActivity.ActivityType.postToTwitter, UIActivity.ActivityType.postToFacebook, UIActivity.ActivityType.init("Skype")]

        self.present(activityVC, animated: true, completion: nil)

    }
    
    @objc func showNotificationController() {
        
        let controller = Constants.VIEWCONTROLLER_WITH_IDENTIFIER("NotificationController")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func newMessageScreen() {
        
        let controller = Constants.VIEWCONTROLLER_WITH_IDENTIFIER("NewMessageController")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func showNormalHud(_ message : String) {
        HUD = JGProgressHUD.init(style: .dark)
        HUD.textLabel.text = message
        HUD.show(in: self.view)
        
    }
    
    @objc func popViewController() {
        _ = self.navigationController?.popViewController(animated: true);
    }

    func removeNormalHud() {
        HUD.dismiss()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func convertUTCToLocal(timeString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        
        dateFormatter.timeZone = TimeZone.init(abbreviation: "UTC")
        let timeUTC = dateFormatter.date(from: timeString)
        
        if timeUTC != nil {
            dateFormatter.timeZone = NSTimeZone.local
            
            let localTime = dateFormatter.string(from: timeUTC!)
            return localTime
        }
        
        return nil
    }

}
