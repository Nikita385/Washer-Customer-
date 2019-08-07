//
//  UserDetail.swift
//  Washer
//
//  Created by Excelsior Technologies on 06/08/19.
//  Copyright © 2019 Excelsior Technologies. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON
import Alamofire
import ObjectMapper


public final class  UserDetail: NSObject,Mappable,NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let MobileNo = "MobileNo"
        static let UserName = "UserName"
        static let RegisterId = "RegisterId"
        static let Email = "Email"
        static let Status = "Status"
        static let HashToken = "HashToken"
        static let Gender = "Gender"
    }
    
    // MARK: Properties

    public var MobileNo : String?
    public var UserName : String?
    public var RegisterId : String?
    public var Email : String?
    public var Status : String?
    public var HashToken : String?
    public var Gender : String?
    
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
        MobileNo = json[SerializationKeys.MobileNo].string
        UserName = json[SerializationKeys.UserName].string
        RegisterId = json[SerializationKeys.RegisterId].string
        Email = json[SerializationKeys.Email].string
        Status = json[SerializationKeys.Status].string
        Gender = json[SerializationKeys.Gender].string
        HashToken = json[SerializationKeys.HashToken].string
    }
    required public init?(map: Map){
        
    }
    
    /**
     Map a JSON object to this class using ObjectMapper
     - parameter map: A mapping from ObjectMapper
     */
    public func mapping(map: Map) {
        
        MobileNo <- map[SerializationKeys.MobileNo]
        UserName <- map[SerializationKeys.UserName]
        RegisterId <- map[SerializationKeys.RegisterId]
        Email <- map[SerializationKeys.Email]
        Status <- map[SerializationKeys.Status]
        Gender <- map[SerializationKeys.Gender]
        HashToken <- map[SerializationKeys.HashToken]
        
    }
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = MobileNo { dictionary[SerializationKeys.MobileNo] = value }
        if let value = UserName { dictionary[SerializationKeys.UserName] = value }
        if let value = RegisterId { dictionary[SerializationKeys.RegisterId] = value }
        if let value = Email { dictionary[SerializationKeys.Email] = value }
        if let value = Status { dictionary[SerializationKeys.Status] = value }
        if let value = Gender { dictionary[SerializationKeys.Gender] = value }
        if let value = HashToken { dictionary[SerializationKeys.HashToken] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.MobileNo = aDecoder.decodeObject(forKey: SerializationKeys.MobileNo) as? String
        self.UserName = aDecoder.decodeObject(forKey: SerializationKeys.UserName) as? String
        self.RegisterId = aDecoder.decodeObject(forKey: SerializationKeys.RegisterId) as? String
        self.Email = aDecoder.decodeObject(forKey: SerializationKeys.Email) as? String
        self.Status = aDecoder.decodeObject(forKey: SerializationKeys.Status) as? String
        self.Gender = aDecoder.decodeObject(forKey: SerializationKeys.Gender) as? String
        self.HashToken = aDecoder.decodeObject(forKey: SerializationKeys.HashToken) as? String
       
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(MobileNo, forKey: SerializationKeys.MobileNo)
        aCoder.encode(UserName, forKey: SerializationKeys.UserName)
        aCoder.encode(RegisterId, forKey: SerializationKeys.RegisterId)
        aCoder.encode(Email, forKey: SerializationKeys.Email)
        aCoder.encode(Status, forKey: SerializationKeys.Status)
        aCoder.encode(Gender, forKey: SerializationKeys.Gender)
        aCoder.encode(HashToken, forKey: SerializationKeys.HashToken)
      
    }
    
}
