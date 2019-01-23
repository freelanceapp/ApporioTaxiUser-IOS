//
//  Data.swift
//
//  Created by Atul Jain on 20/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct BookingDetailsData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let sos = "sos"
    static let movableMarker = "movable_marker"
    static let shareable = "shareable"
    static let pickupLongitude = "pickup_longitude"
    static let driver = "driver"
    static let addressChangeable = "address_changeable"
    static let stillMarker = "still_marker"
    static let sosVisibility = "sos_visibility"
    static let paymentEditable = "payment_editable"
    static let cancelable = "cancelable"
    static let location = "location"
    static let polydata = "polydata"
    static let id = "id"
    static let paymentMethod = "payment_method"
    static let vehicleDetails = "vehicle_details"
    static let bookingStatus = "booking_status"
    static let ployPoints = "ploy_points"
    static let pickupLatitude = "pickup_latitude"
    static let serviceType = "service_type"
    static let cancelReasons = "cancel_reasons"
    static let vehicleType = "vehicle_type"
    static let shareablelink = "share_able_link"
    static let otpenable = "otp_enable"
    static let rideotp = "ride_otp"
  }

  // MARK: Properties
  public var sos: [BookingDetailsSos]?
  public var movableMarker: BookingDetailsMovableMarker?
  public var shareable: Bool? = false
  public var pickupLongitude: String?
  public var driver: BookingDetailsDriver?
  public var addressChangeable: Bool? = false
  public var stillMarker: BookingDetailsStillMarker?
  public var sosVisibility: Bool? = false
  public var paymentEditable: Bool? = false
  public var cancelable: Bool? = false
  public var location: BookingDetailsLocation?
  public var polydata: BookingDetailsPolydata?
  public var id: Int?
  public var paymentMethod: BookingDetailsPaymentMethod?
  public var vehicleDetails: BookingDetailsVehicleDetails?
  public var bookingStatus: String?
  public var ployPoints: String?
  public var pickupLatitude: String?
  public var serviceType: BookingDetailsServiceType?
  public var cancelReasons: [BookingDetailsCancelReasons]?
  public var vehicleType: BookingDetailsVehicleType?
    public var shareablelink: String?
    public var otpenable: String?
    public var rideotp: String?

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
    sos <- map[SerializationKeys.sos]
    movableMarker <- map[SerializationKeys.movableMarker]
    shareable <- map[SerializationKeys.shareable]
    pickupLongitude <- map[SerializationKeys.pickupLongitude]
    driver <- map[SerializationKeys.driver]
    addressChangeable <- map[SerializationKeys.addressChangeable]
    stillMarker <- map[SerializationKeys.stillMarker]
    sosVisibility <- map[SerializationKeys.sosVisibility]
    paymentEditable <- map[SerializationKeys.paymentEditable]
    cancelable <- map[SerializationKeys.cancelable]
    location <- map[SerializationKeys.location]
    polydata <- map[SerializationKeys.polydata]
    id <- map[SerializationKeys.id]
    paymentMethod <- map[SerializationKeys.paymentMethod]
    vehicleDetails <- map[SerializationKeys.vehicleDetails]
    bookingStatus <- map[SerializationKeys.bookingStatus]
    ployPoints <- map[SerializationKeys.ployPoints]
    pickupLatitude <- map[SerializationKeys.pickupLatitude]
    serviceType <- map[SerializationKeys.serviceType]
    cancelReasons <- map[SerializationKeys.cancelReasons]
    vehicleType <- map[SerializationKeys.vehicleType]
     shareablelink <- map[SerializationKeys.shareablelink]
    otpenable <- map[SerializationKeys.otpenable]
    rideotp <- map[SerializationKeys.rideotp]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = sos { dictionary[SerializationKeys.sos] = value.map { $0.dictionaryRepresentation() } }
    if let value = movableMarker { dictionary[SerializationKeys.movableMarker] = value.dictionaryRepresentation() }
    dictionary[SerializationKeys.shareable] = shareable
    if let value = pickupLongitude { dictionary[SerializationKeys.pickupLongitude] = value }
    if let value = driver { dictionary[SerializationKeys.driver] = value.dictionaryRepresentation() }
    dictionary[SerializationKeys.addressChangeable] = addressChangeable
    if let value = stillMarker { dictionary[SerializationKeys.stillMarker] = value.dictionaryRepresentation() }
    dictionary[SerializationKeys.sosVisibility] = sosVisibility
    dictionary[SerializationKeys.paymentEditable] = paymentEditable
    dictionary[SerializationKeys.cancelable] = cancelable
    if let value = location { dictionary[SerializationKeys.location] = value.dictionaryRepresentation() }
    if let value = polydata { dictionary[SerializationKeys.polydata] = value.dictionaryRepresentation() }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = paymentMethod { dictionary[SerializationKeys.paymentMethod] = value.dictionaryRepresentation() }
    if let value = vehicleDetails { dictionary[SerializationKeys.vehicleDetails] = value.dictionaryRepresentation() }
    if let value = bookingStatus { dictionary[SerializationKeys.bookingStatus] = value }
    if let value = ployPoints { dictionary[SerializationKeys.ployPoints] = value }
    if let value = pickupLatitude { dictionary[SerializationKeys.pickupLatitude] = value }
    if let value = serviceType { dictionary[SerializationKeys.serviceType] = value.dictionaryRepresentation() }
    if let value = cancelReasons { dictionary[SerializationKeys.cancelReasons] = value.map { $0.dictionaryRepresentation() } }
    if let value = vehicleType { dictionary[SerializationKeys.vehicleType] = value.dictionaryRepresentation() }
    if let value = shareablelink { dictionary[SerializationKeys.shareablelink] = value }
     if let value = otpenable { dictionary[SerializationKeys.otpenable] = value }
     if let value = rideotp { dictionary[SerializationKeys.rideotp] = value }
    return dictionary
  }

}
