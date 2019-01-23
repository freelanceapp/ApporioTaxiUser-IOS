//
//  Data.swift
//
//  Created by Atul Jain on 26/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct CompleteRideData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let highlightedText = "highlighted_text"
    static let mapImageVisibility = "map_image_visibility"
    static let mapImage = "map_image"
    static let bookingId = "booking_id"
    static let dropLocation = "drop_location"
    static let pickMarkerIcon = "pick_marker_icon"
    static let dropMarkerIcon = "drop_marker_icon"
    static let statusText = "status_text"
    static let pickupLongitude = "pickup_longitude"
    static let dropLatitude = "drop_latitude"
    static let dropLongitude = "drop_longitude"
    static let pickText = "pick_text"
    static let circularImage = "circular_image"
    static let pickupLatitude = "pickup_latitude"
    static let pickVisibility = "pick_visibility"
    static let valueTextVisibility = "value_text_visibility"
    static let ployPoints = "ploy_points"
    static let dropVisibility = "drop_visibility"
    static let valueText = "value_text"
    static let driverBlockVisibility = "driver_block_visibility"
    static let valueTextColor = "value_text_color"
    static let highlightedSmallText = "highlighted_small_text"
  }

  // MARK: Properties
  public var highlightedText: String?
  public var mapImageVisibility: Bool? = false
  public var mapImage: String?
  public var bookingId: Int?
  public var dropLocation: String?
  public var pickMarkerIcon: String?
  public var dropMarkerIcon: String?
  public var statusText: String?
  public var pickupLongitude: String?
  public var dropLatitude: String?
  public var dropLongitude: String?
  public var pickText: String?
  public var circularImage: String?
  public var pickupLatitude: String?
  public var pickVisibility: Bool? = false
  public var valueTextVisibility: Bool? = false
  public var ployPoints: String?
  public var dropVisibility: Bool? = false
  public var valueText: String?
  public var driverBlockVisibility: Bool? = false
  public var valueTextColor: String?
  public var highlightedSmallText: String?

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
    highlightedText <- map[SerializationKeys.highlightedText]
    mapImageVisibility <- map[SerializationKeys.mapImageVisibility]
    mapImage <- map[SerializationKeys.mapImage]
    bookingId <- map[SerializationKeys.bookingId]
    dropLocation <- map[SerializationKeys.dropLocation]
    pickMarkerIcon <- map[SerializationKeys.pickMarkerIcon]
    dropMarkerIcon <- map[SerializationKeys.dropMarkerIcon]
    statusText <- map[SerializationKeys.statusText]
    pickupLongitude <- map[SerializationKeys.pickupLongitude]
    dropLatitude <- map[SerializationKeys.dropLatitude]
    dropLongitude <- map[SerializationKeys.dropLongitude]
    pickText <- map[SerializationKeys.pickText]
    circularImage <- map[SerializationKeys.circularImage]
    pickupLatitude <- map[SerializationKeys.pickupLatitude]
    pickVisibility <- map[SerializationKeys.pickVisibility]
    valueTextVisibility <- map[SerializationKeys.valueTextVisibility]
    ployPoints <- map[SerializationKeys.ployPoints]
    dropVisibility <- map[SerializationKeys.dropVisibility]
    valueText <- map[SerializationKeys.valueText]
    driverBlockVisibility <- map[SerializationKeys.driverBlockVisibility]
    valueTextColor <- map[SerializationKeys.valueTextColor]
    highlightedSmallText <- map[SerializationKeys.highlightedSmallText]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = highlightedText { dictionary[SerializationKeys.highlightedText] = value }
    dictionary[SerializationKeys.mapImageVisibility] = mapImageVisibility
    if let value = mapImage { dictionary[SerializationKeys.mapImage] = value }
    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
    if let value = dropLocation { dictionary[SerializationKeys.dropLocation] = value }
    if let value = pickMarkerIcon { dictionary[SerializationKeys.pickMarkerIcon] = value }
    if let value = dropMarkerIcon { dictionary[SerializationKeys.dropMarkerIcon] = value }
    if let value = statusText { dictionary[SerializationKeys.statusText] = value }
    if let value = pickupLongitude { dictionary[SerializationKeys.pickupLongitude] = value }
    if let value = dropLatitude { dictionary[SerializationKeys.dropLatitude] = value }
    if let value = dropLongitude { dictionary[SerializationKeys.dropLongitude] = value }
    if let value = pickText { dictionary[SerializationKeys.pickText] = value }
    if let value = circularImage { dictionary[SerializationKeys.circularImage] = value }
    if let value = pickupLatitude { dictionary[SerializationKeys.pickupLatitude] = value }
    dictionary[SerializationKeys.pickVisibility] = pickVisibility
    dictionary[SerializationKeys.valueTextVisibility] = valueTextVisibility
    if let value = ployPoints { dictionary[SerializationKeys.ployPoints] = value }
    dictionary[SerializationKeys.dropVisibility] = dropVisibility
    if let value = valueText { dictionary[SerializationKeys.valueText] = value }
    dictionary[SerializationKeys.driverBlockVisibility] = driverBlockVisibility
    if let value = valueTextColor { dictionary[SerializationKeys.valueTextColor] = value }
    if let value = highlightedSmallText { dictionary[SerializationKeys.highlightedSmallText] = value }
    return dictionary
  }

}
