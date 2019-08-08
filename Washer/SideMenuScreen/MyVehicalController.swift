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
    @IBOutlet weak var tableView: UITableView!
    
    private var CarDetailCellExpanded: Bool = false
    
    let kHeaderSectionTag: Int = 6900;
    
    var expandedSectionHeaderNumber: Int = -1
    var expandedSectionHeader: UITableViewHeaderFooterView!
    var sectionItems: Array<Any> = []
    var sectionNames: Array<Any> = []
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //        tableView.delegate = self
        //        tableView.dataSource = self
        
        sectionNames = [ "", "", "", ""]; //Main Heading Names
        sectionItems = [ [""], [""], [""], [""] ];
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if sectionNames.count > 0 {
            tableView.backgroundView = nil
            return sectionNames.count
        } else {
            let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
            messageLabel.text = "Retrieving data.\nPlease wait."
            messageLabel.numberOfLines = 0;
            messageLabel.textAlignment = .center;
            messageLabel.font = UIFont(name: "HelveticaNeue", size: 20.0)!
            messageLabel.sizeToFit()
            self.tableView.backgroundView = messageLabel;
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (self.expandedSectionHeaderNumber == section) {
            let arrayOfItems = self.sectionItems[section] as! NSArray
            return arrayOfItems.count;
        } else {
            return 0;
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (self.sectionNames.count != 0) {
            return self.sectionNames[section] as? String
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
        
        if let viewWithTag = self.view.viewWithTag(kHeaderSectionTag + section) {
            viewWithTag.removeFromSuperview()
        }
        let headerFrame = self.view.frame.size
        let theImageView = UIImageView(frame: CGRect(x: headerFrame.width - 32, y: 13, width: 18, height: 18));
        theImageView.image = UIImage(named: "")
        theImageView.tag = kHeaderSectionTag + section
        header.addSubview(theImageView)
        
        
        let MainView: UIView = UIView(frame: CGRect(x: 51, y: 14, width: 309, height: 71))
        MainView.backgroundColor = UIColor.white
        header.addSubview(MainView)
        
        let CarImage: UIImageView = UIImageView(frame: CGRect(x: -27, y: 11, width: 50, height: 50))
        CarImage.image = UIImage(named: "car filled.png")
        MainView.addSubview(CarImage)
        
        let colorView: UIView = UIView(frame: CGRect(x: 252, y: 8, width: 30, height: 30))
        colorView.backgroundColor = UIColor.init(named: "primaryColor")
        MainView.addSubview(colorView)
        
        let lblName: UILabel = UILabel(frame: CGRect(x: 56, y: 11, width: 162, height: 21))
        lblName.font = UIFont(name: "Montserrat", size: 17.0)!
        lblName.text = "audi"
        MainView.addSubview(lblName)
        
        let lblNumber: UILabel = UILabel(frame: CGRect(x: 56, y: 40, width: 135, height: 21))
        lblNumber.font = UIFont(name: "Montserrat", size: 17.0)!
        lblNumber.text = "0542154"
        MainView.addSubview(lblNumber)
        
        let lblCompany: UILabel = UILabel(frame: CGRect(x: 250, y: 40, width: 79, height: 21))
        lblCompany.font = UIFont(name: "Montserrat", size: 17.0)!
        lblCompany.text = "fdsfs"
        MainView.addSubview(lblCompany)
        
        
        // make headers touchable
        header.tag = section
        let headerTapGesture = UITapGestureRecognizer()
        headerTapGesture.addTarget(self, action: #selector(MyVehicalController.sectionHeaderWasTouched(_:)))
        header.addGestureRecognizer(headerTapGesture)
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellClass
        //
        //        cell.imageview.applyRadiusBorder(radius: (cell.imageView?.frame.size.width)!/2, borderWidth: 0, borderColor:.clear)
        //        cell.imageview.clipsToBounds = true
        //
        //        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as UITableViewCell
        let section = self.sectionItems[indexPath.section] as! NSArray
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.text = section[indexPath.row] as? String
        //        cell.imageView?.image = UIImage.init(named: "minilogoblue.png")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        if (section == 0)
        {
            return 100
        }
        return 100
    }
    
    @objc func sectionHeaderWasTouched(_ sender: UITapGestureRecognizer) {
        let headerView = sender.view as! UITableViewHeaderFooterView
        let section = headerView.tag
        let eImageView = headerView.viewWithTag(kHeaderSectionTag + section) as? UIImageView
        
        if (self.expandedSectionHeaderNumber == -1) {
            self.expandedSectionHeaderNumber = section
            tableViewExpandSection(section, imageView: eImageView!)
        } else {
            if (self.expandedSectionHeaderNumber == section) {
                tableViewCollapeSection(section, imageView: eImageView!)
            } else {
                let cImageView = self.view.viewWithTag(kHeaderSectionTag + self.expandedSectionHeaderNumber) as? UIImageView
                tableViewCollapeSection(self.expandedSectionHeaderNumber, imageView: cImageView!)
                tableViewExpandSection(section, imageView: eImageView!)
            }
        }
    }
    
    
    func tableViewExpandSection(_ section: Int, imageView: UIImageView) {
        let sectionData = self.sectionItems[section] as! NSArray
        if (sectionData.count == 0) {
            self.expandedSectionHeaderNumber = -1;
            return;
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                imageView.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(Double.pi)) / 180.0)
            })
            var indexesPath = [IndexPath]()
            for i in 0 ..< sectionData.count {
                let index = IndexPath(row: i, section: section)
                indexesPath.append(index)
            }
            self.expandedSectionHeaderNumber = section
            self.tableView!.beginUpdates()
            self.tableView!.insertRows(at: indexesPath, with: UITableView.RowAnimation.fade)
            self.tableView!.endUpdates()
        }
    }
    
    func tableViewCollapeSection(_ section: Int, imageView: UIImageView) {
        let sectionData = self.sectionItems[section] as! NSArray
        self.expandedSectionHeaderNumber = -1;
        if (sectionData.count == 0) {
            return;
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                imageView.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(Double.pi)) / 180.0)
            })
            var indexesPath = [IndexPath]()
            for i in 0 ..< sectionData.count {
                let index = IndexPath(row: i, section: section)
                indexesPath.append(index)
            }
            self.tableView!.beginUpdates()
            self.tableView!.deleteRows(at: indexesPath, with: UITableView.RowAnimation.fade)
            self.tableView!.endUpdates()
        }
    }
    
    private func tableview(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    private func tableview(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            if CarDetailCellExpanded {
                return 250
            } else {
                return 50
            }
        }
        return 50
    }
    
    @IBAction func tap_SideMenu(_ sender: Any) {
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
    
}
