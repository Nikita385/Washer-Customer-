//
//  MyVehicalController.swift
//  Washer
//
//  Created by Excelsior Technologies on 02/08/19.
//  Copyright © 2019 Excelsior Technologies. All rights reserved.
//

import UIKit


class MyVehicalController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellClass
        
        cell.imageview.applyRadiusBorder(radius: (cell.imageView?.frame.size.width)!/2, borderWidth: 0, borderColor:.clear)
        cell.imageview.clipsToBounds = true
        
        return cell
    }
    
    @IBAction func onBtnMenuClicked(_ sender: Any)
    {
        sideMenuController?.revealMenu()
    }
    
    @IBAction func onBtnAddClicked(_ sender: Any)
    {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AddVehicalController") as! AddVehicalController
         self.present(nextViewController, animated:true, completion:nil)
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

class CellClass: UITableViewCell {
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblnumber: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var Colorview: UIView!
    
}
