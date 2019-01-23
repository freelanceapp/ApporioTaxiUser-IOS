//
//  SelectedPaymentMethod.swift
//
//  Created by Atul Jain on 17/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct SelectedPaymentMethod: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let id = "id"
    static let name = "name"
    static let cardId = "card_id"
  }

  // MARK: Properties
  public var id: String?
  public var name: String?
  public var cardId: String?

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
    name <- map[SerializationKeys.name]
    cardId <- map[SerializationKeys.cardId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = cardId { dictionary[SerializationKeys.cardId] = value }
    return dictionary
  }

}
