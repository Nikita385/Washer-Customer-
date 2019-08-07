//
//  PackageBase.swift
//  Washer
//
//  Created by Excelsior Technologies on 07/08/19.
//  Copyright © 2019 Excelsior Technologies. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import ObjectMapper
class PackageBase:  NSObject,Mappable,NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        
        static let message = "StatusMessage"
        static let myPackageList = "MyPackageList"
        static let status = "Status"
        static let packageDetail = "package"
    }
    
    // MARK: Properties
    
    public var message: String?
    public var myPackageList: NSArray?
    public var status: String?
    public var packageDetail: PackageDetail?
    
    
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
        
        message = json[SerializationKeys.message].string
        myPackageList = json[SerializationKeys.myPackageList].array as NSArray?
        status = json[SerializationKeys.status].string
        packageDetail = PackageDetail(json: json[SerializationKeys.myPackageList])
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
        
        
        message <- map[SerializationKeys.message]
        myPackageList <- map[SerializationKeys.myPackageList]
        status <- map[SerializationKeys.status]
    }
    
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        
        if let value = message { dictionary[SerializationKeys.message] = value }
        if let value = myPackageList { dictionary[SerializationKeys.myPackageList] = value }
        if let value = status { dictionary[SerializationKeys.status] = value }
        
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        
        self.message = aDecoder.decodeObject(forKey: SerializationKeys.message) as? String
        self.myPackageList = aDecoder.decodeObject(forKey: SerializationKeys.myPackageList) as! NSArray?
        self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        
        aCoder.encode(message, forKey: SerializationKeys.message)
        aCoder.encode(myPackageList, forKey: SerializationKeys.myPackageList)
        aCoder.encode(status, forKey: SerializationKeys.status)
    }
    
    
    static func getPackageList(urlPath:String,parameters:Parameters,completionHandler:@escaping (_  user:PackageBase)->Void,Failure:@escaping (_ error:String)->Void){
        let header : [String : String] =  [
            "HashToken": (Singleton.sharedInstance.userData.HashToken)!,
        ]
        AFWrapper.requestPOSTURL(urlPath, params: parameters, headers: header, success: { (JSONResponse) in
            
            //print(JSONResponse)
            let package = PackageBase.init(json: JSONResponse)
            completionHandler(package)
            
        }) { (error) in
            Failure(error.localizedDescription)
            print(error)
            
        }
        
    }
    
}
