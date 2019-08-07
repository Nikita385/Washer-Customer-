import Foundation
import Alamofire
import JGProgressHUD
class Connectivity:BaseController {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    override func showNormalHud(_ message : String) {
        HUD = JGProgressHUD.init(style: .dark)
        HUD.textLabel.text = message
        HUD.show(in: self.view)
        
    }
    
    override func removeNormalHud() {
        HUD.dismiss()
    }

    
}
