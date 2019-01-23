//
//  Data.swift
//
//  Created by Atul Jain on 06/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RateCardData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let serviceStatus = "serviceStatus"
    static let updatedAt = "updated_at"
    static let id = "id"
    static let createdAt = "created_at"
    static let serviceName = "serviceName"
    static let package = "package"
    static let type = "type"
    static let vehicleType = "vehicle_type"
    static let merchantId = "merchant_id"
  }

  // MARK: Properties
  public var serviceStatus: String?
  public var updatedAt: String?
  public var id: Int?
  public var createdAt: String?
  public var serviceName: String?
  public var package: String?
  public var type: String?
  public var vehicleType: [RateCardVehicleType]?
  public var merchantId: String?

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
    serviceStatus <- map[SerializationKeys.serviceStatus]
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    createdAt <- map[SerializationKeys.createdAt]
    serviceName <- map[SerializationKeys.serviceName]
    package <- map[SerializationKeys.package]
    type <- map[SerializationKeys.type]
    vehicleType <- map[SerializationKeys.vehicleType]
    merchantId <- map[SerializationKeys.merchantId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = serviceStatus { dictionary[SerializationKeys.serviceStatus] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = serviceName { dictionary[SerializationKeys.serviceName] = value }
    if let value = package { dictionary[SerializationKeys.package] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = vehicleType { dictionary[SerializationKeys.vehicleType] = value.map { $0.dictionaryRepresentation() } }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    return dictionary
  }

}
