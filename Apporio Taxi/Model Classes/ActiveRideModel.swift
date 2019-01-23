//
//  ActiveRideModel.swift
//
//  Created by Atul Jain on 20/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ActiveRideModel: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let data = "data"
    static let message = "message"
    static let result = "result"
    static let bookable = "bookable"
  }

  // MARK: Properties
  public var data: [ActiveRideData]?
  public var message: String?
  public var result: String?
  public var bookable: Bool? = false

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
    data <- map[SerializationKeys.data]
    message <- map[SerializationKeys.message]
    result <- map[SerializationKeys.result]
    bookable <- map[SerializationKeys.bookable]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = data { dictionary[SerializationKeys.data] = value.map { $0.dictionaryRepresentation() } }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = result { dictionary[SerializationKeys.result] = value }
    dictionary[SerializationKeys.bookable] = bookable
    return dictionary
  }

}
