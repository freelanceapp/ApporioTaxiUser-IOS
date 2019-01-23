//
//  Data.swift
//
//  Created by Atul Jain on 20/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ActiveRideData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let bookingDetail = "booking_detail"
    static let bookingStatus = "booking_status"
    static let id = "id"
    static let bookingTimestamp = "booking_timestamp"
  }

  // MARK: Properties
  public var bookingDetail: ActiveRideBookingDetail?
  public var bookingStatus: String?
  public var id: Int?
  public var bookingTimestamp: String?

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
    bookingDetail <- map[SerializationKeys.bookingDetail]
    bookingStatus <- map[SerializationKeys.bookingStatus]
    id <- map[SerializationKeys.id]
    bookingTimestamp <- map[SerializationKeys.bookingTimestamp]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = bookingDetail { dictionary[SerializationKeys.bookingDetail] = value.dictionaryRepresentation() }
    if let value = bookingStatus { dictionary[SerializationKeys.bookingStatus] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = bookingTimestamp { dictionary[SerializationKeys.bookingTimestamp] = value }
    return dictionary
  }

}
