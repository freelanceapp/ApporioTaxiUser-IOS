//
//  Data.swift
//
//  Created by Atul Jain on 03/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct AddDriverFavouriteData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let bookingId = "booking_id"
    static let driverId = "driver_id"
    static let id = "id"
    static let userId = "user_id"
    static let updatedAt = "updated_at"
    static let createdAt = "created_at"
  }

  // MARK: Properties
  public var bookingId: String?
  public var driverId: String?
  public var id: Int?
  public var userId: Int?
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
    bookingId <- map[SerializationKeys.bookingId]
    driverId <- map[SerializationKeys.driverId]
    id <- map[SerializationKeys.id]
    userId <- map[SerializationKeys.userId]
    updatedAt <- map[SerializationKeys.updatedAt]
    createdAt <- map[SerializationKeys.createdAt]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
    if let value = driverId { dictionary[SerializationKeys.driverId] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    return dictionary
  }

}
