//
//  Chat.swift
//
//  Created by Atul Jain on 03/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ViewUserChatChat: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let sender = "sender"
    static let timestamp = "timestamp"
    static let message = "message"
  }

  // MARK: Properties
  public var sender: String?
  public var timestamp: Int?
  public var message: String?

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
    sender <- map[SerializationKeys.sender]
    timestamp <- map[SerializationKeys.timestamp]
    message <- map[SerializationKeys.message]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = sender { dictionary[SerializationKeys.sender] = value }
    if let value = timestamp { dictionary[SerializationKeys.timestamp] = value }
    if let value = message { dictionary[SerializationKeys.message] = value }
    return dictionary
  }

}
