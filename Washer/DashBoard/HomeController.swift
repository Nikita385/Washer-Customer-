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

class HomeController: UIViewController,BottomSheetDelegate,GMSMapViewDelegate {
  @IBOutlet weak var btn_menu: UIButton!
  @IBOutlet private weak var mapView: GMSMapView!
  @IBOutlet weak var backView: UIView!
  @IBOutlet weak var container: UIView!
  @IBOutlet weak var lblAddress: UILabel!
  @IBOutlet weak var btn_gpsIcon: UIButton!
  @IBOutlet weak var view_locationBack: UIView!
  var coordinates:CLLocationCoordinate2D?
    var destinationMarker:GMSMarker?
    override func viewDidLoad() {
        super.viewDidLoad()
       self.getCurrentLocation()
        self.mapView.delegate = self
        container.layer.cornerRadius = 15
        container.layer.masksToBounds = true
        mapView.isUserInteractionEnabled = true
        btn_gpsIcon.applyRadiusBorder(radius: btn_gpsIcon.frame.size.height/2, borderWidth: 0.0, borderColor: .clear)
        let tap = UITapGestureRecognizer(target: self, action: Selector(("handleTap:")))
 
        view_locationBack.addGestureRecognizer(tap)
    }
    override func viewWillAppear(_ animated: Bool) {
        if  (Singleton.sharedInstance.location != nil) {
            updateLocationoordinates(coordinates:Singleton.sharedInstance.location!)
            lblAddress.text = Singleton.sharedInstance.currentAddress
        }
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "SearchPlaceController") as! SearchPlaceController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let vc = segue.destination as? BottomSheetController{
            vc.bottomSheetDelegate = self
            vc.parentView = container
        }
    }
    
    func updateBottomSheet(frame: CGRect) {
        container.frame = frame

    }
 

    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        
            var destinationLocation = CLLocation()
            destinationLocation = CLLocation(latitude: position.target.latitude,  longitude: position.target.longitude)
            getCurrentPlace(coordinate:destinationLocation.coordinate)
            self.coordinates =  destinationLocation.coordinate
            updateLocationoordinates(coordinates: destinationLocation.coordinate)
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
                let mapInsets = UIEdgeInsets(top: 80.0, left: 0.0, bottom: 45.0, right: 0.0)
                self.mapView.padding = mapInsets
                
                manager.distanceFilter = 100
               
                // GOOGLE MAPS SDK: COMPASS
                self.mapView.settings.compassButton = true
                
                // GOOGLE MAPS SDK: USER'S LOCATION
                self.mapView.isMyLocationEnabled = true
                self.mapView.settings.myLocationButton = true
                self.updateLocationoordinates(coordinates:currentCoordinate)
            
            }

        }
    }

    func updateLocationoordinates(coordinates:CLLocationCoordinate2D) {
        if destinationMarker == nil {
            let marker1 = GMSMarker(position: coordinates)
            marker1.map = mapView
            mapView.camera = GMSCameraPosition(target: coordinates, zoom: 15, bearing: 0,
                                               viewingAngle: 0)
            destinationMarker = marker1
        }else{
            destinationMarker!.position =  coordinates
            mapView.camera = GMSCameraPosition(target: coordinates, zoom: 15, bearing: 0,
                                               viewingAngle: 0)

        }
      
       
    }
    func getCurrentPlace(coordinate: CLLocationCoordinate2D) {
        
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            if error != nil {
                return
            }
            let pm = placemarks! as [CLPlacemark]
    
            if pm.count > 0 {
                let pm = placemarks![0]
          
                var addressString : String = ""
                if pm.subLocality != nil {
                    addressString = addressString + pm.subLocality! + ", "
                }
                if pm.thoroughfare != nil {
                    addressString = addressString + pm.thoroughfare! + ", "
                }
                if pm.locality != nil {
                    addressString = addressString + pm.locality! + ", "
                }
                if pm.country != nil {
                    addressString = addressString + pm.country! + ", "
                }
                if pm.postalCode != nil {
                    addressString = addressString + pm.postalCode! + " "
                }
                self.lblAddress.text = addressString
            }
        })
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
