//
//  ServiceTypes.swift
//
//  Created by Atul Jain on 11/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct CarsTimeServiceTypes: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let vehicles = "vehicles"
    static let serviceStatus = "serviceStatus"
    static let updatedAt = "updated_at"
    static let id = "id"
    static let createdAt = "created_at"
    static let serviceName = "serviceName"
    static let package = "package"
    static let merchantId = "merchant_id"
  }

  // MARK: Properties
  public var vehicles: [CarsTimeVehicles]?
  public var serviceStatus: String?
  public var updatedAt: String?
  public var id: Int?
  public var createdAt: String?
  public var serviceName: String?
  public var package: [CarsTimePackage]?
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
    vehicles <- map[SerializationKeys.vehicles]
    serviceStatus <- map[SerializationKeys.serviceStatus]
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    createdAt <- map[SerializationKeys.createdAt]
    serviceName <- map[SerializationKeys.serviceName]
    package <- map[SerializationKeys.package]
    merchantId <- map[SerializationKeys.merchantId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = vehicles { dictionary[SerializationKeys.vehicles] = value.map { $0.dictionaryRepresentation() } }
    if let value = serviceStatus { dictionary[SerializationKeys.serviceStatus] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = serviceName { dictionary[SerializationKeys.serviceName] = value }
    if let value = package { dictionary[SerializationKeys.package] = value.map { $0.dictionaryRepresentation() } }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    return dictionary
  }

}
