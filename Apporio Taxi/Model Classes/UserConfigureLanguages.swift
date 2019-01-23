//
//  Languages.swift
//
//  Created by Atul Jain on 01/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct UserConfigureLanguages: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let updatedAt = "updated_at"
    static let id = "id"
    static let locale = "locale"
    static let createdAt = "created_at"
  }

  // MARK: Properties
  public var name: String?
  public var updatedAt: String?
  public var id: Int?
  public var locale: String?
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
    name <- map[SerializationKeys.name]
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    locale <- map[SerializationKeys.locale]
    createdAt <- map[SerializationKeys.createdAt]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = locale { dictionary[SerializationKeys.locale] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    return dictionary
  }

}
