//
//  Vehicles.swift
//
//  Created by Atul Jain on 11/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct CarsTimeVehicles: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let vehicleTypeMapImage = "vehicleTypeMapImage"
    static let vehicleTypeImage = "vehicleTypeImage"
    static let id = "id"
    static let updatedAt = "updated_at"
    static let createdAt = "created_at"
    static let vehicleTypeName = "vehicleTypeName"
    static let vehicleTypeStatus = "vehicleTypeStatus"
    static let vehicleTypeRank = "vehicleTypeRank"
    static let merchantId = "merchant_id"
    static let servicetypeid = "service_type_id"
  }

  // MARK: Properties
  public var vehicleTypeMapImage: String?
  public var vehicleTypeImage: String?
  public var id: Int?
  public var updatedAt: String?
  public var createdAt: String?
  public var vehicleTypeName: String?
  public var vehicleTypeStatus: String?
  public var vehicleTypeRank: String?
  public var merchantId: String?
    public var servicetypeid: Int?

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
    vehicleTypeMapImage <- map[SerializationKeys.vehicleTypeMapImage]
    vehicleTypeImage <- map[SerializationKeys.vehicleTypeImage]
    id <- map[SerializationKeys.id]
    updatedAt <- map[SerializationKeys.updatedAt]
    createdAt <- map[SerializationKeys.createdAt]
    vehicleTypeName <- map[SerializationKeys.vehicleTypeName]
    vehicleTypeStatus <- map[SerializationKeys.vehicleTypeStatus]
    vehicleTypeRank <- map[SerializationKeys.vehicleTypeRank]
    merchantId <- map[SerializationKeys.merchantId]
    servicetypeid <- map[SerializationKeys.servicetypeid]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = vehicleTypeMapImage { dictionary[SerializationKeys.vehicleTypeMapImage] = value }
    if let value = vehicleTypeImage { dictionary[SerializationKeys.vehicleTypeImage] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = vehicleTypeName { dictionary[SerializationKeys.vehicleTypeName] = value }
    if let value = vehicleTypeStatus { dictionary[SerializationKeys.vehicleTypeStatus] = value }
    if let value = vehicleTypeRank { dictionary[SerializationKeys.vehicleTypeRank] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = servicetypeid { dictionary[SerializationKeys.servicetypeid] = value }
    return dictionary
  }

}
