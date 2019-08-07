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

class PackageDetail: NSObject,Mappable,NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        
        static let Amount = "Amount"
        static let Description = "Description"
        static let DiscountPercentage = "DiscountPercentage"
        static let Duration = "Duration"
        static let MyPackageId = "MyPackageId"
        static let PackageBuyDate = "PackageBuyDate"
        static let PackageBuyTime = "PackageBuyTime"
        static let PackageCategory = "PackageCategory"
        static let PackageCategoryId = "PackageCategoryId"
        static let PackageDetails = "PackageDetails"
        static let PackageDetailsId = "PackageDetailsId"
        static let PackageId = "PackageId"
        static let PackageName = "PackageName"
        static let VehicleType = "VehicleType"
        static let VehicleTypeId = "VehicleTypeId"
        
    }
    
    // MARK: Properties
    
    public var Amount: String?
    public var Description: String?
    public var DiscountPercentage: String?
    public var Duration: String?
    public var MyPackageId: String?
    public var PackageBuyDate: String?
    public var PackageBuyTime: String?
    public var PackageCategory: String?
    public var PackageCategoryId: String?
    public var PackageDetails: String?
    public var PackageDetailsId: String?
    public var PackageId: String?
    public var PackageName: String?
    public var VehicleType: String?
    public var VehicleTypeId: String?
    
    
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
        
        Amount = json[SerializationKeys.Amount].string
        Description = json[SerializationKeys.Description].string
        DiscountPercentage = json[SerializationKeys.DiscountPercentage].string
        Duration = json[SerializationKeys.Duration].string
        MyPackageId = json[SerializationKeys.MyPackageId].string
        PackageBuyDate = json[SerializationKeys.PackageBuyDate].string
        PackageBuyTime = json[SerializationKeys.PackageBuyTime].string
        PackageCategory = json[SerializationKeys.PackageCategory].string
        PackageCategoryId = json[SerializationKeys.PackageCategoryId].string
        PackageDetails = json[SerializationKeys.PackageDetails].string
        PackageDetailsId = json[SerializationKeys.PackageDetailsId].string
        PackageId = json[SerializationKeys.PackageId].string
        PackageName = json[SerializationKeys.PackageName].string
        VehicleType = json[SerializationKeys.VehicleType].string
        VehicleTypeId = json[SerializationKeys.VehicleTypeId].string
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
        
        
        Amount <- map[SerializationKeys.Amount]
        Description <- map[SerializationKeys.Description]
        DiscountPercentage <- map[SerializationKeys.DiscountPercentage]
        Duration <- map[SerializationKeys.Duration]
        MyPackageId <- map[SerializationKeys.MyPackageId]
        PackageBuyDate <- map[SerializationKeys.PackageBuyDate]
        PackageBuyTime <- map[SerializationKeys.PackageBuyTime]
        PackageCategory <- map[SerializationKeys.PackageCategory]
        PackageCategoryId <- map[SerializationKeys.PackageCategoryId]
        PackageDetails <- map[SerializationKeys.PackageDetails]
        PackageDetailsId <- map[SerializationKeys.PackageDetailsId]
        PackageId <- map[SerializationKeys.PackageId]
        PackageName <- map[SerializationKeys.PackageName]
        VehicleType <- map[SerializationKeys.VehicleType]
        VehicleTypeId <- map[SerializationKeys.VehicleTypeId]
    }
    
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        
        if let value = Amount { dictionary[SerializationKeys.Amount] = value }
        if let value = Description { dictionary[SerializationKeys.Description] = value }
        if let value = DiscountPercentage { dictionary[SerializationKeys.DiscountPercentage] = value }
        if let value = Duration { dictionary[SerializationKeys.Duration] = value }
        if let value = MyPackageId { dictionary[SerializationKeys.MyPackageId] = value }
        if let value = PackageBuyDate { dictionary[SerializationKeys.PackageBuyDate] = value }
        if let value = PackageBuyTime { dictionary[SerializationKeys.PackageBuyTime] = value }
        if let value = PackageCategory { dictionary[SerializationKeys.PackageCategory] = value }
        if let value = PackageCategoryId { dictionary[SerializationKeys.PackageCategoryId] = value }
        if let value = PackageDetails { dictionary[SerializationKeys.PackageDetails] = value }
        if let value = PackageDetailsId { dictionary[SerializationKeys.PackageDetailsId] = value }
        if let value = PackageId { dictionary[SerializationKeys.PackageId] = value }
        if let value = PackageName { dictionary[SerializationKeys.PackageName] = value }
        if let value = VehicleType { dictionary[SerializationKeys.VehicleType] = value }
        if let value = VehicleTypeId { dictionary[SerializationKeys.VehicleTypeId] = value }
        
        
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        
        self.Amount = aDecoder.decodeObject(forKey: SerializationKeys.Amount) as? String
        self.Description = aDecoder.decodeObject(forKey: SerializationKeys.Description) as? String
        self.DiscountPercentage = aDecoder.decodeObject(forKey: SerializationKeys.DiscountPercentage) as? String
        self.Duration = aDecoder.decodeObject(forKey: SerializationKeys.Duration) as? String
        self.MyPackageId = aDecoder.decodeObject(forKey: SerializationKeys.MyPackageId) as? String
        self.PackageBuyDate = aDecoder.decodeObject(forKey: SerializationKeys.PackageBuyDate) as? String
        self.PackageBuyTime = aDecoder.decodeObject(forKey: SerializationKeys.PackageBuyTime) as? String
        self.PackageCategory = aDecoder.decodeObject(forKey: SerializationKeys.PackageCategory) as? String
        self.PackageCategoryId = aDecoder.decodeObject(forKey: SerializationKeys.PackageCategoryId) as? String
        self.PackageDetails = aDecoder.decodeObject(forKey: SerializationKeys.PackageDetails) as? String
        self.PackageDetailsId = aDecoder.decodeObject(forKey: SerializationKeys.PackageDetailsId) as? String
        self.PackageId = aDecoder.decodeObject(forKey: SerializationKeys.PackageId) as? String
        self.PackageName = aDecoder.decodeObject(forKey: SerializationKeys.PackageName) as? String
        self.VehicleType = aDecoder.decodeObject(forKey: SerializationKeys.VehicleType) as? String
        self.VehicleTypeId = aDecoder.decodeObject(forKey: SerializationKeys.VehicleTypeId) as? String
        
    }
    
    public func encode(with aCoder: NSCoder) {
        
        aCoder.encode(Amount, forKey: SerializationKeys.Amount)
        aCoder.encode(Description, forKey: SerializationKeys.Description)
        aCoder.encode(DiscountPercentage, forKey: SerializationKeys.DiscountPercentage)
        aCoder.encode(Duration, forKey: SerializationKeys.Duration)
        aCoder.encode(MyPackageId, forKey: SerializationKeys.MyPackageId)
        aCoder.encode(PackageBuyDate, forKey: SerializationKeys.PackageBuyDate)
        aCoder.encode(PackageBuyTime, forKey: SerializationKeys.PackageBuyTime)
        aCoder.encode(PackageCategory, forKey: SerializationKeys.PackageCategory)
        aCoder.encode(PackageCategoryId, forKey: SerializationKeys.PackageCategoryId)
        aCoder.encode(PackageDetails, forKey: SerializationKeys.PackageDetails)
        aCoder.encode(PackageDetailsId, forKey: SerializationKeys.PackageDetailsId)
        aCoder.encode(PackageId, forKey: SerializationKeys.PackageId)
        aCoder.encode(PackageName, forKey: SerializationKeys.PackageName)
        aCoder.encode(VehicleType, forKey: SerializationKeys.VehicleType)
        aCoder.encode(VehicleTypeId, forKey: SerializationKeys.VehicleTypeId)
        
    }
    
    
    
    
}
