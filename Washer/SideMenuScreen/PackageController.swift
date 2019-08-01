//
//  PackageController.swift
//  Washer
//
//  Created by Excelsior Technologies on 01/08/19.
//  Copyright © 2019 Excelsior Technologies. All rights reserved.
//

import UIKit


class PackageController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SelectionCell
        return cell
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

class SelectionCell: UITableViewCell {
    @IBOutlet weak var lblService: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDatetime: UILabel!
    @IBOutlet weak var lblValidity: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblDays: UILabel!

    @IBOutlet weak var CarImage: UIImageView!
    @IBOutlet weak var CalanderImage: UIImageView!
}
