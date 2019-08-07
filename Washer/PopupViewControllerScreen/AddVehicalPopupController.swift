//
//  AddVehicalPopupController.swift
//  Washer
//
//  Created by Excelsior Technologies on 07/08/19.
//  Copyright © 2019 Excelsior Technologies. All rights reserved.
//

import UIKit

class AddVehicalPopupController: UIViewController,PopupContentViewController
{
    var closeHandler: (() -> Void)?

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    class func instance() -> AddVehicalPopupController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "AddVehicalPopupController") as! AddVehicalPopupController
    }
    
    func sizeForPopup(_ popupController: PopupController, size: CGSize, showingKeyboard: Bool) -> CGSize {
        return CGSize(width: 380,height: 400)
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
