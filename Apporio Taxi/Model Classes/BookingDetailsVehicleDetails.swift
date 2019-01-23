//
//  VehicleDetails.swift
//
//  Created by Atul Jain on 20/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct BookingDetailsVehicleDetails: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let service = "service"
    static let vehicleColor = "vehicle_color"
    static let vehicleImage = "vehicle_image"
    static let vehicle = "vehicle"
    static let vehicleTypeImage = "vehicle_type_image"
    static let vehicleModel = "vehicle_model"
    static let vehicleNumber = "vehicle_number"
    static let vehicleMake = "vehicle_make"
  }

  // MARK: Properties
  public var service: String?
  public var vehicleColor: String?
  public var vehicleImage: String?
  public var vehicle: String?
  public var vehicleTypeImage: String?
  public var vehicleModel: String?
  public var vehicleNumber: String?
  public var vehicleMake: String?

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
    service <- map[SerializationKeys.service]
    vehicleColor <- map[SerializationKeys.vehicleColor]
    vehicleImage <- map[SerializationKeys.vehicleImage]
    vehicle <- map[SerializationKeys.vehicle]
    vehicleTypeImage <- map[SerializationKeys.vehicleTypeImage]
    vehicleModel <- map[SerializationKeys.vehicleModel]
    vehicleNumber <- map[SerializationKeys.vehicleNumber]
    vehicleMake <- map[SerializationKeys.vehicleMake]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = service { dictionary[SerializationKeys.service] = value }
    if let value = vehicleColor { dictionary[SerializationKeys.vehicleColor] = value }
    if let value = vehicleImage { dictionary[SerializationKeys.vehicleImage] = value }
    if let value = vehicle { dictionary[SerializationKeys.vehicle] = value }
    if let value = vehicleTypeImage { dictionary[SerializationKeys.vehicleTypeImage] = value }
    if let value = vehicleModel { dictionary[SerializationKeys.vehicleModel] = value }
    if let value = vehicleNumber { dictionary[SerializationKeys.vehicleNumber] = value }
    if let value = vehicleMake { dictionary[SerializationKeys.vehicleMake] = value }
    return dictionary
  }

}
