//
//  HolderUser.swift
//
//  Created by Atul Jain on 26/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RideDetailsHolderUser: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let visibility = "visibility"
    static let userData = "data"
  }

  // MARK: Properties
  public var visibility: Bool? = false
  public var userData: RideDetailsUserData?

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
    visibility <- map[SerializationKeys.visibility]
    userData <- map[SerializationKeys.userData]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.visibility] = visibility
    if let value = userData { dictionary[SerializationKeys.userData] = value.dictionaryRepresentation() }
    return dictionary
  }

}
