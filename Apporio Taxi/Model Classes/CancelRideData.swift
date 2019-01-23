//
//  Data.swift
//
//  Created by Atul Jain on 03/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct CancelRideData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let id = "id"
    static let updatedAt = "updated_at"
    static let createdAt = "created_at"
  }

  // MARK: Properties
  public var id: Int?
  public var updatedAt: String?
  public var createdAt: String?

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
    id <- map[SerializationKeys.id]
    updatedAt <- map[SerializationKeys.updatedAt]
    createdAt <- map[SerializationKeys.createdAt]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    return dictionary
  }

}
