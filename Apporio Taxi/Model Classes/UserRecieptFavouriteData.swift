//
//  FavouriteData.swift
//
//  Created by Atul Jain on 22/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct UserRecieptFavouriteData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let bookingId = "booking_id"
    static let text = "text"
    static let driverId = "driver_id"
  }

  // MARK: Properties
  public var bookingId: String?
  public var text: String?
  public var driverId: String?

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
    text <- map[SerializationKeys.text]
    driverId <- map[SerializationKeys.driverId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
    if let value = text { dictionary[SerializationKeys.text] = value }
    if let value = driverId { dictionary[SerializationKeys.driverId] = value }
    return dictionary
  }

}
