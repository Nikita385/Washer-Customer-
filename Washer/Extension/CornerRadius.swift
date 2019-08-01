//
//  CornerRadius.swift
//  yummCloud
//
//  Created by Excelsior Technologies on 18/06/19.
//

import Foundation
import UIKit

extension UIView{
    
    //set cornerRadius
    func applyRadiusBorder(radius:CGFloat, borderWidth:CGFloat, borderColor:UIColor){
        self.layoutIfNeeded()
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}

extension URL {
    public var queryParameters: [String: String]? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
    }
    
}
