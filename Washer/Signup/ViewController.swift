//
//  ViewController.swift
//  Washer
//
//  Created by Excelsior Technologies on 31/07/19.
//  Copyright © 2019 Excelsior Technologies. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class ViewController: UIViewController {

    @IBOutlet weak var view_phoneNo: UIView!
    @IBOutlet weak var view_contryCode: UIView!
    
    @IBOutlet weak var txt_MoNo: UITextField!
    @IBOutlet weak var txt_countryCode: UITextField!
    @IBOutlet weak var btn_next: UIButton!
    @IBOutlet weak var btn_Inquiry: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn_next.applyRadiusBorder(radius: 5.0, borderWidth: 1.0, borderColor: .white)
        view_phoneNo.applyRadiusBorder(radius: 5.0, borderWidth: 0.0, borderColor: .clear)
        view_contryCode.applyRadiusBorder(radius: 5.0, borderWidth: 0.0, borderColor: .clear)
          IQKeyboardManager.shared.enabledToolbarClasses.append(ViewController.self)
        // Do any additional setup after loading the view.
    }

    @IBAction func tap_next(_ sender: Any) {
       Constants.APP_DELEGATE.setHomeController()
    }
    
    @IBAction func tap_inquiry(_ sender: Any) {
    }
}

