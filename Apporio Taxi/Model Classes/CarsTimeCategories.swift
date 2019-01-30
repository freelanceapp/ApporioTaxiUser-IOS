//
//  Categories.swift
//
//  Created by Gyanender on 24/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct CarsTimeCategories: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let name = "name"
    static let updatedAt = "updated_at"
    static let id = "id"
    static let countryAreaId = "country_area_id"
    static let vehicle = "vehicle"
    static let createdAt = "created_at"
    static let merchantId = "merchant_id"
  }

  // MARK: Properties
  public var status: String?
  public var name: String?
  public var updatedAt: String?
  public var id: Int?
  public var countryAreaId: String?
  public var vehicle: [CarsTimeVehicle]?
  public var createdAt: String?
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
    status <- map[SerializationKeys.status]
    name <- map[SerializationKeys.name]
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    countryAreaId <- map[SerializationKeys.countryAreaId]
    vehicle <- map[SerializationKeys.vehicle]
    createdAt <- map[SerializationKeys.createdAt]
    merchantId <- map[SerializationKeys.merchantId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = countryAreaId { dictionary[SerializationKeys.countryAreaId] = value }
    if let value = vehicle { dictionary[SerializationKeys.vehicle] = value.map { $0.dictionaryRepresentation() } }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    return dictionary
  }

}
