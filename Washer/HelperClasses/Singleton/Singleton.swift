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
    

}
