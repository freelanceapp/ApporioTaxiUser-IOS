//
//  Package.swift
//
//  Created by Atul Jain on 11/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct CarsTimePackage: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let vehicles = "vehicles"
    static let name = "name"
    static let updatedAt = "updated_at"
    static let id = "id"
    static let createdAt = "created_at"
    static let serviceTypeId = "service_type_id"
    static let packageStatus = "packageStatus"
    static let merchantId = "merchant_id"
  }

  // MARK: Properties
  public var vehicles: [CarsTimeVehicles]?
  public var name: String?
  public var updatedAt: String?
  public var id: Int?
  public var createdAt: String?
  public var serviceTypeId: String?
  public var packageStatus: String?
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
    name <- map[SerializationKeys.name]
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    createdAt <- map[SerializationKeys.createdAt]
    serviceTypeId <- map[SerializationKeys.serviceTypeId]
    packageStatus <- map[SerializationKeys.packageStatus]
    merchantId <- map[SerializationKeys.merchantId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = vehicles { dictionary[SerializationKeys.vehicles] = value.map { $0.dictionaryRepresentation() } }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = serviceTypeId { dictionary[SerializationKeys.serviceTypeId] = value }
    if let value = packageStatus { dictionary[SerializationKeys.packageStatus] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    return dictionary
  }

}
