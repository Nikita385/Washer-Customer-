//
//  PackageController.swift
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

class PackageController: BaseController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var tableView: UITableView!
    var packageList : NSArray = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getMyPackageList()
    
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return packageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SelectionCell
        let packageDetail = PackageDetail.init(object: packageList.object(at: indexPath.row))
//        let packageDetail = packageList.object(at: indexPath.row) as! PackageDetail
        cell.lblService.text = packageDetail.PackageName
        cell.lblDays.text = packageDetail.Duration
        cell.lblPrice.text = packageDetail.Amount
        cell.lblType.text = packageDetail.PackageCategory
        cell.lblDate.text = packageDetail.PackageBuyDate
        cell.lblTime.text = packageDetail.PackageBuyTime
        return cell
    }
    

    // MARK: - API My package list
    func getMyPackageList(){
        var parameter:Parameters!
        parameter = ["RegisterId":  Singleton.sharedInstance.userData.RegisterId!]
        self.showNormalHud(NSLocalizedString("Please Wait...", comment: ""))
        
        PackageBase.getPackageList(urlPath: BASE_URL+GET_MYPACKAGE, parameters: parameter, completionHandler: { (package) in
            self.removeNormalHud()
             if (package.status == "True")
            {
                Singleton.sharedInstance.packageList = package.myPackageList
                Constants.USER_DEFAULTS.rm_setCustomObject(  Singleton.sharedInstance.packageList, forKey: "myPackageList")
                self.packageList = Singleton.sharedInstance.packageList!
                self.tableView.reloadData()
                
            }
            
        }) { (error) in
            self.removeNormalHud()
            self.view.makeToast("Server is not responding", duration: 1, position: .center)
        }
        
    }
    

  
}

class SelectionCell: UITableViewCell {
    @IBOutlet weak var lblService: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTime: UILabel!

    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblDays: UILabel!

    @IBOutlet weak var CarImage: UIImageView!
    @IBOutlet weak var CalanderImage: UIImageView!
}
