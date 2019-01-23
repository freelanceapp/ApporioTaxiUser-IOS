//
//  Data.swift
//
//  Created by Atul Jain on 03/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ViewFavouriteDriverData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let bookingId = "booking_id"
    static let updatedAt = "updated_at"
    static let id = "id"
    static let createdAt = "created_at"
    static let driver = "driver"
    static let driverId = "driver_id"
    static let userId = "user_id"
  }

  // MARK: Properties
  public var bookingId: String?
  public var updatedAt: String?
  public var id: Int?
  public var createdAt: String?
  public var driver: ViewFavouriteDriver?
  public var driverId: String?
  public var userId: String?

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
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    createdAt <- map[SerializationKeys.createdAt]
    driver <- map[SerializationKeys.driver]
    driverId <- map[SerializationKeys.driverId]
    userId <- map[SerializationKeys.userId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = driver { dictionary[SerializationKeys.driver] = value.dictionaryRepresentation() }
    if let value = driverId { dictionary[SerializationKeys.driverId] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    return dictionary
  }

}
