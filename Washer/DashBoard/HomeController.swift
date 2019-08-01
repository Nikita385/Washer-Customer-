//
//  HomeController.swift
//  Washer
//
//  Created by Excelsior Technologies on 31/07/19.
//  Copyright © 2019 Excelsior Technologies. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class HomeController: UIViewController,BottomSheetDelegate {
  @IBOutlet weak var btn_menu: UIButton!
  @IBOutlet private weak var mapView: GMSMapView!
  @IBOutlet weak var backView: UIView!
  @IBOutlet weak var container: UIView!
  var coordinates:CLLocationCoordinate2D?
    override func viewDidLoad() {
        super.viewDidLoad()
       self.getCurrentLocation()
        container.layer.cornerRadius = 15
        container.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? BottomSheetController{
            vc.bottomSheetDelegate = self
            vc.parentView = container
        }
    }
    
    func updateBottomSheet(frame: CGRect) {
        container.frame = frame
        //        backView.frame = self.view.frame.offsetBy(dx: 0, dy: 15 + container.frame.minY - self.view.frame.height)
        //        backView.backgroundColor = UIColor.black.withAlphaComponent(1 - (frame.minY)/200)
    }
    // MARK: - Current Location
    func getCurrentLocation(){
        
        let manager:BBLocationManager = BBLocationManager.shared()
        
        manager.getCurrentLocation{ (success, dataLocation, error) in
            
            print(error)
            
            if success == true {
                
                let currentCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees(dataLocation![BB_LATITUDE] as! Double), CLLocationDegrees(dataLocation![BB_LONGITUDE] as! Double))
                print(currentCoordinate)
              
                self.coordinates = currentCoordinate
                self.configureMap()
            
            }

        }
    }
    private func configureMap() {
        // Place a marker on the map and center it on the desired coordinates.
        let marker = GMSMarker(position: self.coordinates!)
        marker.map = mapView
        mapView.camera = GMSCameraPosition(target: self.coordinates!, zoom: 15, bearing: 0,
                                           viewingAngle: 0)
        mapView.isUserInteractionEnabled = true
    }
    @IBAction func tap_SideMenu(_ sender: Any) {
          sideMenuController?.revealMenu()
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
