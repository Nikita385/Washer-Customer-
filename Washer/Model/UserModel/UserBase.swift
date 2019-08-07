//
//  UserBase.swift
//
//     4/26/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import ObjectMapper


public final class UserBase: NSObject,Mappable,NSCoding  {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let result = "Result"
        static let message = "StatusMessage"
        static let userDetails = "UserDetails"
        static let user = "user"
    }
    
    // MARK: Properties

    public var message: String?
    public var userDetails: NSArray?
    public var user: UserDetail?
    
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
        userDetails = json[SerializationKeys.userDetails].array as NSArray?
        user = UserDetail(json: json[SerializationKeys.userDetails][0])
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
        userDetails <- map[SerializationKeys.userDetails]
        
    }
    
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]

        if let value = message { dictionary[SerializationKeys.message] = value }
        if let value = userDetails { dictionary[SerializationKeys.userDetails] = value }

        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
   
        self.message = aDecoder.decodeObject(forKey: SerializationKeys.message) as? String
        self.userDetails = aDecoder.decodeObject(forKey: SerializationKeys.userDetails) as! NSArray?
      
    }
    
    public func encode(with aCoder: NSCoder) {
       
        aCoder.encode(message, forKey: SerializationKeys.message)
        aCoder.encode(userDetails, forKey: SerializationKeys.userDetails)

    }
    
    
    
    
    static func registerUser(urlPath:String,parameters:Parameters,imageData:[String:Any],loaderOnView:UIView,completionHandler:@escaping (_ user:UserBase)->Void,Failure:@escaping (_ error:String)->Void)
    {
        AFWrapper.requestPOSTWithSingleImage(urlPath, parameters: parameters, dataImage: imageData, headers: nil, success: { (JSONResponse) in
            
            //print(JSONResponse)
            let user = UserBase.init(json: JSONResponse)
            
            completionHandler(user)
            
        }) { (error) in
            Failure(error.localizedDescription)
            print(error)
        }
    }
    
    static func signUpUser(urlPath:String,parameters:Parameters,completionHandler:@escaping (_ user:UserBase)->Void,Failure:@escaping (_ error:String)->Void){
        
        AFWrapper.requestPOSTURL(urlPath, params: parameters, headers: nil, success: { (JSONResponse) in
            
            //print(JSONResponse)
            let user = UserBase.init(json: JSONResponse)
            completionHandler(user)
            
        }) { (error) in
            Failure(error.localizedDescription)
            print(error)
            
        }
        
    }
    
    static func verifyUserCode(urlPath:String,parameters:Parameters,completionHandler:@escaping (_ user:UserBase)->Void,Failure:@escaping (_ error:String)->Void){
        
        AFWrapper.requestPOSTURL(urlPath, params: parameters, headers: nil, success: { (JSONResponse) in
            
            //print(JSONResponse)
            let user = UserBase.init(json: JSONResponse)
            completionHandler(user)
            
        }) { (error) in
            Failure(error.localizedDescription)
            print(error)
            
        }
        
    }
    
    
 
    
    static func logoutUser(urlPath:String,parameters:Parameters,completionHandler:@escaping (_  response: JSON)->Void,Failure:@escaping (_ error:String)->Void){
        let header : [String : String] =  [
            "HashToken": (Singleton.sharedInstance.userData.HashToken)!,
        ]
        AFWrapper.requestPOSTURL(urlPath, params: parameters, headers: header, success: { (JSON) in
            
            
            completionHandler(JSON)
            
        }) { (error) in
            Failure(error.localizedDescription)
            print(error)
            
        }
        
    }
 
    static func updateUserProfile(urlPath:String,parameters:Parameters,imageData:[String:Any]?, header:[String:String]?, completionHandler:@escaping (_ user:UserBase)->Void,Failure:@escaping (_ error:String)->Void)
    {
        AFWrapper.requestPOSTWithSingleImage(urlPath, parameters: parameters, dataImage: imageData, headers: header, success: { (JSONResponse) in
            
            
            print(JSONResponse)
            let user = UserBase.init(json: JSONResponse)
            completionHandler(user)
            
        }) { (error) in
            Failure(error.localizedDescription)
            print(error)
        }
    }
    
    static func updateUserToken(urlPath:String, parameters:Parameters, header:[String:String]?, completionHandler:@escaping (_ user:UserBase)->Void, Failure:@escaping (_ error:String)->Void)
    {
        AFWrapper.requestPOSTURL(urlPath, params: parameters, headers: header, success: { (JSONResponse) in
            
            print(JSONResponse)
            let user = UserBase.init(json: JSONResponse)
            completionHandler(user)
            
        }) { (error) in
            Failure(error.localizedDescription)
            print(error)
        }
    }

    
    
    
    
    static func loginUser(urlPath:String,parameters:Parameters,loaderOnView:UIView,completionHandler:@escaping (_ user:UserBase)->Void,Failure:@escaping (_ error:String)->Void)
    {
        
        AFWrapper.requestPOSTURL(urlPath, params: parameters, headers: nil, success: { (JSONResponse) in
            
            //print(JSONResponse)
            let user = UserBase.init(json: JSONResponse)
            completionHandler(user)
        }) { (error) in
            Failure(error.localizedDescription )
            print(error)
        }
    }
    
    
    static func getResendCode(urlPath:String,parameters:Parameters,completionHandler:@escaping (_ user:UserBase)->Void,Failure:@escaping (_ error:String)->Void){
        
        AFWrapper.requestPOSTURL(urlPath, params: parameters, headers: nil, success: { (JSONResponse) in
            
            //print(JSONResponse)
            let user = UserBase.init(json: JSONResponse)
            completionHandler(user)
            
            
            
        }) { (error) in
            Failure(error.localizedDescription)
            print(error)
            
        }
        
    }

    
    
}
