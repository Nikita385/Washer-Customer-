//
//  ProfileDetail.swift
//  Washer
//
//  Created by Excelsior Technologies on 06/08/19.
//  Copyright © 2019 Excelsior Technologies. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import ObjectMapper

class ProfileDetail: NSObject,Mappable,NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {

        static let Address = "Address"
        static let Email = "Email"
        static let FullName = "FullName"
        static let Gender = "Gender"
        static let MobileNumber = "MobileNumber"
        static let MyOrders = "MyOrders"
        static let MyPackages = "MyPackages"
        static let MyTotalVehicles = "MyTotalVehicles"
        static let OfficeAddress = "OfficeAddress"
        static let OtherAddress = "OtherAddress"
        static let ProfilePicture = "ProfilePicture"
        static let TotalPaid = "TotalPaid"
  
    }
    
    // MARK: Properties
    
    public var Address: String?
    public var Email: String?
    public var FullName: String?
    public var Gender: String?
    public var MobileNumber: String?
    public var MyOrders: String?
    public var MyPackages: String?
    public var MyTotalVehicles: String?
    public var OfficeAddress: String?
    public var OtherAddress: String?
    public var ProfilePicture: String?
    public var TotalPaid: String?

    
    // MARK: SwiftyJSON Initializers
    /// Initiates the instance based on the object.
    ///
    /// - parameter object: The object of either Dictionary or Array kind that was passed.
    /// - returns: An initialized instance of the class.
    public convenience init(object: Any) {
        self.init(json: JSON(object))
    }
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public required init(json: JSON) {
        
        Address = json[SerializationKeys.Address].string
        Email = json[SerializationKeys.Email].string
        FullName = json[SerializationKeys.FullName].string
        Gender = json[SerializationKeys.Gender].string
        MobileNumber = json[SerializationKeys.MobileNumber].string
        MyOrders = json[SerializationKeys.MyOrders].string
        MyPackages = json[SerializationKeys.MyPackages].string
        MyTotalVehicles = json[SerializationKeys.MyTotalVehicles].string
        OfficeAddress = json[SerializationKeys.OfficeAddress].string
        OtherAddress = json[SerializationKeys.OtherAddress].string
        ProfilePicture = json[SerializationKeys.ProfilePicture].string
        TotalPaid = json[SerializationKeys.TotalPaid].string
        
       
    }
    
    
    // MARK: ObjectMapper Initalizers
    /**
     Map a JSON object to this class using ObjectMapper
     - parameter map: A mapping from ObjectMapper
     */
    required public init?(map: Map){
        
    }
    
    /**
     Map a JSON object to this class using ObjectMapper
     - parameter map: A mapping from ObjectMapper
     */
    public func mapping(map: Map) {
        
        
        Address <- map[SerializationKeys.Address]
        Email <- map[SerializationKeys.Email]
        FullName <- map[SerializationKeys.FullName]
        Gender <- map[SerializationKeys.Gender]
        MobileNumber <- map[SerializationKeys.MobileNumber]
        MyOrders <- map[SerializationKeys.MyOrders]
        MyPackages <- map[SerializationKeys.MyPackages]
        MyTotalVehicles <- map[SerializationKeys.MyTotalVehicles]
        OfficeAddress <- map[SerializationKeys.OfficeAddress]
        OtherAddress <- map[SerializationKeys.OtherAddress]
        ProfilePicture <- map[SerializationKeys.ProfilePicture]
        TotalPaid <- map[SerializationKeys.TotalPaid]

    }
    
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        
        if let value = Address { dictionary[SerializationKeys.Address] = value }
        if let value = Email { dictionary[SerializationKeys.Email] = value }
        if let value = FullName { dictionary[SerializationKeys.FullName] = value }
        if let value = Gender { dictionary[SerializationKeys.Gender] = value }
        if let value = MobileNumber { dictionary[SerializationKeys.MobileNumber] = value }
        if let value = MyOrders { dictionary[SerializationKeys.MyOrders] = value }
        if let value = MyPackages { dictionary[SerializationKeys.MyPackages] = value }
        if let value = MyTotalVehicles { dictionary[SerializationKeys.MyTotalVehicles] = value }
        if let value = OfficeAddress { dictionary[SerializationKeys.OfficeAddress] = value }
        if let value = OtherAddress { dictionary[SerializationKeys.OtherAddress] = value }
        if let value = ProfilePicture { dictionary[SerializationKeys.ProfilePicture] = value }
         if let value = TotalPaid { dictionary[SerializationKeys.TotalPaid] = value }
       
        
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        
         self.Address = aDecoder.decodeObject(forKey: SerializationKeys.Address) as? String
          self.Email = aDecoder.decodeObject(forKey: SerializationKeys.Email) as? String
          self.FullName = aDecoder.decodeObject(forKey: SerializationKeys.FullName) as? String
          self.Gender = aDecoder.decodeObject(forKey: SerializationKeys.Gender) as? String
          self.MobileNumber = aDecoder.decodeObject(forKey: SerializationKeys.MobileNumber) as? String
          self.MyOrders = aDecoder.decodeObject(forKey: SerializationKeys.MyOrders) as? String
          self.MyPackages = aDecoder.decodeObject(forKey: SerializationKeys.MyPackages) as? String
          self.MyTotalVehicles = aDecoder.decodeObject(forKey: SerializationKeys.MyTotalVehicles) as? String
          self.OfficeAddress = aDecoder.decodeObject(forKey: SerializationKeys.OfficeAddress) as? String
          self.OtherAddress = aDecoder.decodeObject(forKey: SerializationKeys.OtherAddress) as? String
          self.ProfilePicture = aDecoder.decodeObject(forKey: SerializationKeys.ProfilePicture) as? String
         self.TotalPaid = aDecoder.decodeObject(forKey: SerializationKeys.TotalPaid) as? String
  
    }
    
    public func encode(with aCoder: NSCoder) {
        
        aCoder.encode(Address, forKey: SerializationKeys.Address)
        aCoder.encode(Email, forKey: SerializationKeys.Email)
        aCoder.encode(FullName, forKey: SerializationKeys.FullName)
        aCoder.encode(Gender, forKey: SerializationKeys.Gender)
        aCoder.encode(MobileNumber, forKey: SerializationKeys.MobileNumber)
        aCoder.encode(MyOrders, forKey: SerializationKeys.MyOrders)
        aCoder.encode(MyPackages, forKey: SerializationKeys.MyPackages)
        aCoder.encode(MyTotalVehicles, forKey: SerializationKeys.MyTotalVehicles)
        aCoder.encode(OfficeAddress, forKey: SerializationKeys.OfficeAddress)
        aCoder.encode(OtherAddress, forKey: SerializationKeys.OtherAddress)
        aCoder.encode(ProfilePicture, forKey: SerializationKeys.ProfilePicture)
        aCoder.encode(TotalPaid, forKey: SerializationKeys.TotalPaid)
        
      
    }
    


    
}
