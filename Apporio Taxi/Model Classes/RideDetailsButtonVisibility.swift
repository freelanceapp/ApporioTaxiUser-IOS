//
//  ButtonVisibility.swift
//
//  Created by Atul Jain on 26/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RideDetailsButtonVisibility: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let cancel = "cancel"
        static let coupon = "coupon"
        static let mailInvoice = "mail_invoice"
        static let support = "support"
        static let track = "track"
    }
    
    // MARK: Properties
    public var cancel: Bool? = false
    public var coupon: Bool? = false
    public var mailInvoice: Bool? = false
    public var support: Bool? = false
    public var track: Bool? = false
    
    // MARK: ObjectMapper Initializers
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public init?(map: Map){
        
    }
    
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public mutating func mapping(map: Map) {
        cancel <- map[SerializationKeys.cancel]
        coupon <- map[SerializationKeys.coupon]
        mailInvoice <- map[SerializationKeys.mailInvoice]
        support <- map[SerializationKeys.support]
        track <- map[SerializationKeys.track]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        dictionary[SerializationKeys.cancel] = cancel
        dictionary[SerializationKeys.coupon] = coupon
        dictionary[SerializationKeys.mailInvoice] = mailInvoice
        dictionary[SerializationKeys.support] = support
        dictionary[SerializationKeys.track] = track
        return dictionary
    }
    
}
