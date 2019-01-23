//
//  DriverData.swift
//
//  Created by Atul Jain on 22/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct UserRecieptDriverData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let bookingId = "booking_id"
    static let image = "image"
    static let text = "text"
  }

  // MARK: Properties
  public var bookingId: String?
  public var image: String?
  public var text: String?

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
    image <- map[SerializationKeys.image]
    text <- map[SerializationKeys.text]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = text { dictionary[SerializationKeys.text] = value }
    return dictionary
  }

}
