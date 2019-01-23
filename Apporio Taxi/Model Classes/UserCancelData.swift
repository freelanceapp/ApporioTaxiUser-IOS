//
//  Data.swift
//
//  Created by Atul Jain on 08/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct UserCancelData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let bookingId = "booking_id"
    static let bookingStatus = "booking_status"
  }

  // MARK: Properties
  public var bookingId: Int?
  public var bookingStatus: String?

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
    bookingStatus <- map[SerializationKeys.bookingStatus]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
    if let value = bookingStatus { dictionary[SerializationKeys.bookingStatus] = value }
    return dictionary
  }

}
