//
//  Data.swift
//
//  Created by Atul Jain on 03/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct AddedFavouriteData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let latitude = "latitude"
    static let location = "location"
    static let updatedAt = "updated_at"
    static let id = "id"
    static let createdAt = "created_at"
    static let userId = "user_id"
    static let longitude = "longitude"
    static let category = "category"
    static let othername = "other_name"
  }

  // MARK: Properties
  public var latitude: String?
  public var location: String?
  public var updatedAt: String?
  public var id: Int?
  public var createdAt: String?
  public var userId: String?
  public var longitude: String?
  public var category: String?
     public var othername: String?

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
    latitude <- map[SerializationKeys.latitude]
    location <- map[SerializationKeys.location]
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    createdAt <- map[SerializationKeys.createdAt]
    userId <- map[SerializationKeys.userId]
    longitude <- map[SerializationKeys.longitude]
    category <- map[SerializationKeys.category]
    othername <- map[SerializationKeys.othername]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = latitude { dictionary[SerializationKeys.latitude] = value }
    if let value = location { dictionary[SerializationKeys.location] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = longitude { dictionary[SerializationKeys.longitude] = value }
    if let value = category { dictionary[SerializationKeys.category] = value }
     if let value = othername { dictionary[SerializationKeys.othername] = value }
    return dictionary
  }

}
