//
//  ProfileController.swift
//  Washer
//
//  Created by Excelsior Technologies on 01/08/19.
//  Copyright © 2019 Excelsior Technologies. All rights reserved.
//

import UIKit

class ProfileController: UIViewController
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

        // Do any additional setup after loading the view.
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
