//
//  CustomerSupport.swift
//
//  Created by Atul Jain on 01/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct UserConfigureCustomerSupport: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let mail = "mail"
    static let phone = "phone"
  }

  // MARK: Properties
  public var mail: String?
  public var phone: String?

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
    mail <- map[SerializationKeys.mail]
    phone <- map[SerializationKeys.phone]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = mail { dictionary[SerializationKeys.mail] = value }
    if let value = phone { dictionary[SerializationKeys.phone] = value }
    return dictionary
  }

}
