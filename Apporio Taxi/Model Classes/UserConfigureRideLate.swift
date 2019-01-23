//
//  RideLate.swift
//
//  Created by Atul Jain on 01/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct UserConfigureRideLate: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let rideLaterHours = "ride_later_hours"
    static let outstationTime = "outstation_time"
  }

  // MARK: Properties
  public var rideLaterHours: String?
  public var outstationTime: String?

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
    rideLaterHours <- map[SerializationKeys.rideLaterHours]
    outstationTime <- map[SerializationKeys.outstationTime]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = rideLaterHours { dictionary[SerializationKeys.rideLaterHours] = value }
    if let value = outstationTime { dictionary[SerializationKeys.outstationTime] = value }
    return dictionary
  }

}
