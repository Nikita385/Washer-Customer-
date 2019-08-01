//
//  MenuViewController.swift
//  SideMenuExample
//
//  Created by kukushi on 11/02/2018.
//  Copyright © 2018 kukushi. All rights reserved.
//

import UIKit
import SideMenuSwift

class Preferences {
    static let shared = Preferences()
    var enableTransitionAnimation = false
}

class MenuViewController: UIViewController {
    var isDarkModeEnabled = false
    var arrMenu : NSMutableArray = []
    var arrMenuImage : NSMutableArray = []
  
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
        }
    }
    @IBOutlet weak var selectionTableViewHeader: UILabel!
    
    @IBOutlet weak var selectionMenuTrailingConstraint: NSLayoutConstraint!
    private var themeColor = UIColor.white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isDarkModeEnabled = SideMenuController.preferences.basic.position == .under
        configureView()
        
        sideMenuController?.cache(viewControllerGenerator: {
            self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
        }, with: "1")
        
        sideMenuController?.cache(viewControllerGenerator: {
            self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController")
        }, with: "2")
        
        sideMenuController?.delegate = self
        
      
        
        arrMenu = ["Home","Profile","My Orders","My Vehicles","Package","Wallet","Help & Support","Privacy & Policy"]
        arrMenuImage = [UIImage(named: "home")!,UIImage(named: "profile"),UIImage(named: "myOrder"),UIImage(named: "myVehicles"),UIImage(named: "package"),UIImage(named: "wallet"),UIImage(named: "helpSupport"),UIImage(named: "privacyPolicy")]
//        arrMenuImage = ["Invite Facebook Friend"]

        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
//            let contentSize = self.tableView.contentSize
//            let boundsSize = self.tableView.bounds.size
//
//            if contentSize.height < boundsSize.height {
//
//                let yOffset = floor(boundsSize.height - contentSize.height) / 2
//                self.tableView.contentOffset = CGPoint(x: 0, y: -yOffset)
//            }
//        })
        
    }
    private func configureView() {
        if isDarkModeEnabled {
            themeColor = UIColor(red: 0.03, green: 0.04, blue: 0.07, alpha: 1.00)
            selectionTableViewHeader.textColor = .white
        } else {
            //            selectionMenuTrailingConstraint.constant = 0
            themeColor = UIColor(red: 0.98, green: 0.97, blue: 0.96, alpha: 1.00)
        }
        
        let sidemenuBasicConfiguration = SideMenuController.preferences.basic
        let showPlaceTableOnLeft = (sidemenuBasicConfiguration.position == .under) != (sidemenuBasicConfiguration.direction == .right)
        if showPlaceTableOnLeft {
            //            selectionMenuTrailingConstraint.constant = SideMenuController.preferences.basic.menuWidth - view.frame.width
        }
        SideMenuController.preferences.basic.enableRubberEffectWhenPanning = false
        view.backgroundColor = .clear
        tableView.backgroundColor = .white
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        let sidemenuBasicConfiguration = SideMenuController.preferences.basic
        let showPlaceTableOnLeft = (sidemenuBasicConfiguration.position == .under) != (sidemenuBasicConfiguration.direction == .right)
        //        selectionMenuTrailingConstraint.constant = showPlaceTableOnLeft ? SideMenuController.preferences.basic.menuWidth - size.width : 0
        view.layoutIfNeeded()
    }
}

extension MenuViewController: SideMenuControllerDelegate {
    func sideMenuController(_ sideMenuController: SideMenuController,
                            animationControllerFrom fromVC: UIViewController,
                            to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BasicTransitionAnimator(options: .transitionFlipFromLeft, duration: 0.6)
    }
    
    func sideMenuController(_ sideMenuController: SideMenuController, willShow viewController: UIViewController, animated: Bool) {
        print("[Example] View controller will show [\(viewController)]")
    }
    
    func sideMenuController(_ sideMenuController: SideMenuController, didShow viewController: UIViewController, animated: Bool) {
        print("[Example] View controller did show [\(viewController)]")
    }
    
    func sideMenuControllerWillHideMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu will hide")
    }
    
    func sideMenuControllerDidHideMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu did hide.")
    }
    
    func sideMenuControllerWillRevealMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu will reveal.")
    }
    
    func sideMenuControllerDidRevealMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu did reveal.")
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return arrMenu.count+1
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuHeaderCell", for: indexPath) as! MenuHeaderCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.titleLabel?.text = (arrMenu .object(at: indexPath.row-1) as! String)
            let menuIcon = arrMenuImage[indexPath .row-1]
            cell.imgIcon.image =  (menuIcon as! UIImage)
            if indexPath.row == 3 || indexPath.row == 4{
                cell.lblCount.isHidden = false
                cell.lblCount.applyRadiusBorder(radius: cell.lblCount.frame.size.height/2, borderWidth: 0.0, borderColor: .clear)
            }else{
                cell.lblCount.isHidden = true
            }
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row == 2
        {
           performSegue(withIdentifier: "ShowMyProfile", sender: self)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 120
        }else{
            return 50
        }
    }
        
    }
    

    


class MenuCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
}
class MenuHeaderCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMobileNo: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
}
