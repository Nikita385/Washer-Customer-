//
//  Singleton.swift
//  Versole
//


import Foundation
import CoreLocation
class Singleton {

    static let sharedInstance = Singleton()
    var location:CLLocationCoordinate2D?
    var currentAddress : String = ""
    var homeViewController : HomeController!
    var deviceToken:String = ""
    var mobileNo:String = ""
    var deviceName:String = ""
    var isBlockPopupShown = false
    var userData:UserDetail!
    var profileData:ProfileDetail!
    var packageDetail:PackageDetail!
    var packageList : NSArray?
    

}
