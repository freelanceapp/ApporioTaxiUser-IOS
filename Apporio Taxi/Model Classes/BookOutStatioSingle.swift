//
//  Single.swift
//
//  Created by Atul Jain on 05/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper


public struct BookOutStationSingle: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let packageId = "package_id"
    static let updatedAt = "updated_at"
    static let vechileImage = "vechile_image"
    static let baseFare = "base_fare"
    static let vehicleTypeId = "vehicle_type_id"
    static let merchantId = "merchant_id"
    static let pricingType = "pricing_type"
    static let id = "id"
    static let countryAreaId = "country_area_id"
    static let createdAt = "created_at"
    static let vechileName = "vechile_name"
    static let vechileDescription = "vechile_description"
    static let serviceTypeId = "service_type_id"
    static let freeTime = "free_time"
    static let freeDistance = "free_distance"
  }

  // MARK: Properties
  public var packageId: String?
  public var updatedAt: String?
  public var vechileImage: String?
  public var baseFare: String?
  public var vehicleTypeId: String?
  public var merchantId: String?
  public var pricingType: String?
  public var id: Int?
  public var countryAreaId: String?
  public var createdAt: String?
  public var vechileName: String?
  public var vechileDescription: String?
  public var serviceTypeId: String?
  public var freeTime: String?
  public var freeDistance: String?

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
    packageId <- map[SerializationKeys.packageId]
    updatedAt <- map[SerializationKeys.updatedAt]
    vechileImage <- map[SerializationKeys.vechileImage]
    baseFare <- map[SerializationKeys.baseFare]
    vehicleTypeId <- map[SerializationKeys.vehicleTypeId]
    merchantId <- map[SerializationKeys.merchantId]
    pricingType <- map[SerializationKeys.pricingType]
    id <- map[SerializationKeys.id]
    countryAreaId <- map[SerializationKeys.countryAreaId]
    createdAt <- map[SerializationKeys.createdAt]
    vechileName <- map[SerializationKeys.vechileName]
    vechileDescription <- map[SerializationKeys.vechileDescription]
    serviceTypeId <- map[SerializationKeys.serviceTypeId]
    freeTime <- map[SerializationKeys.freeTime]
    freeDistance <- map[SerializationKeys.freeDistance]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = packageId { dictionary[SerializationKeys.packageId] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = vechileImage { dictionary[SerializationKeys.vechileImage] = value }
    if let value = baseFare { dictionary[SerializationKeys.baseFare] = value }
    if let value = vehicleTypeId { dictionary[SerializationKeys.vehicleTypeId] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = pricingType { dictionary[SerializationKeys.pricingType] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = countryAreaId { dictionary[SerializationKeys.countryAreaId] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = vechileName { dictionary[SerializationKeys.vechileName] = value }
    if let value = vechileDescription { dictionary[SerializationKeys.vechileDescription] = value }
    if let value = serviceTypeId { dictionary[SerializationKeys.serviceTypeId] = value }
    if let value = freeTime { dictionary[SerializationKeys.freeTime] = value }
    if let value = freeDistance { dictionary[SerializationKeys.freeDistance] = value }
    return dictionary
  }

}
