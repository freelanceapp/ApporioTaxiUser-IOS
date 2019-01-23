//
//  HolderBookingDescription.swift
//
//  Created by Atul Jain on 26/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RideDetailsHolderBookingDescription: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let visibility = "visibility"
    static let descriptionData = "data"
  }

  // MARK: Properties
  public var visibility: Bool? = false
  public var descriptionData: RideDetailsDescriptionData?

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
    descriptionData <- map[SerializationKeys.descriptionData]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.visibility] = visibility
    if let value = descriptionData { dictionary[SerializationKeys.descriptionData] = value.dictionaryRepresentation() }
    return dictionary
  }

}
