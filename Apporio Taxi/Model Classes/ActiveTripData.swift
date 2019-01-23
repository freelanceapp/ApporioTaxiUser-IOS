//
//  Data.swift
//
//  Created by Atul Jain on 26/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ActiveTripData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let bookingId = "booking_id"
    static let highlightedText = "highlighted_text"
    static let dropLocation = "drop_location"
    static let driverName = "driver_name"
    static let statusText = "status_text"
    static let statusColor = "status_color"
    static let pickText = "pick_text"
    static let driverRating = "driver_rating"
    static let pickVisibility = "pick_visibility"
    static let dropVisibility = "drop_visibility"
    static let valueText = "value_text"
    static let smallText = "small_text"
    static let valueColor = "value_color"
    static let driverBlockVisibility = "driver_block_visibility"
    static let driverImage = "driver_image"
  }

  // MARK: Properties
  public var bookingId: Int?
  public var highlightedText: String?
  public var dropLocation: String?
  public var driverName: String?
  public var statusText: String?
  public var statusColor: String?
  public var pickText: String?
  public var driverRating: String?
  public var pickVisibility: Bool? = false
  public var dropVisibility: Bool? = false
  public var valueText: String?
  public var smallText: String?
  public var valueColor: String?
  public var driverBlockVisibility: Bool? = false
  public var driverImage: String?

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
    highlightedText <- map[SerializationKeys.highlightedText]
    dropLocation <- map[SerializationKeys.dropLocation]
    driverName <- map[SerializationKeys.driverName]
    statusText <- map[SerializationKeys.statusText]
    statusColor <- map[SerializationKeys.statusColor]
    pickText <- map[SerializationKeys.pickText]
    driverRating <- map[SerializationKeys.driverRating]
    pickVisibility <- map[SerializationKeys.pickVisibility]
    dropVisibility <- map[SerializationKeys.dropVisibility]
    valueText <- map[SerializationKeys.valueText]
    smallText <- map[SerializationKeys.smallText]
    valueColor <- map[SerializationKeys.valueColor]
    driverBlockVisibility <- map[SerializationKeys.driverBlockVisibility]
    driverImage <- map[SerializationKeys.driverImage]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
    if let value = highlightedText { dictionary[SerializationKeys.highlightedText] = value }
    if let value = dropLocation { dictionary[SerializationKeys.dropLocation] = value }
    if let value = driverName { dictionary[SerializationKeys.driverName] = value }
    if let value = statusText { dictionary[SerializationKeys.statusText] = value }
    if let value = statusColor { dictionary[SerializationKeys.statusColor] = value }
    if let value = pickText { dictionary[SerializationKeys.pickText] = value }
    if let value = driverRating { dictionary[SerializationKeys.driverRating] = value }
    dictionary[SerializationKeys.pickVisibility] = pickVisibility
    dictionary[SerializationKeys.dropVisibility] = dropVisibility
    if let value = valueText { dictionary[SerializationKeys.valueText] = value }
    if let value = smallText { dictionary[SerializationKeys.smallText] = value }
    if let value = valueColor { dictionary[SerializationKeys.valueColor] = value }
    dictionary[SerializationKeys.driverBlockVisibility] = driverBlockVisibility
    if let value = driverImage { dictionary[SerializationKeys.driverImage] = value }
    return dictionary
  }

}
