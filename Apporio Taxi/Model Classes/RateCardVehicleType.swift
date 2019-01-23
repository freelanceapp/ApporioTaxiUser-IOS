//
//  VehicleType.swift
//
//  Created by Atul Jain on 06/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RateCardVehicleType: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let vehicleTypeImage = "vehicleTypeImage"
    static let poolEnable = "pool_enable"
    static let updatedAt = "updated_at"
    static let vehicleTypeDescription = "vehicleTypeDescription"
    static let vehicleTypeRank = "vehicleTypeRank"
    static let vehicleTypeStatus = "vehicleTypeStatus"
    static let vehicleTypeId = "vehicle_type_id"
    static let baseFare = "base_fare"
    static let merchantId = "merchant_id"
    static let vehicleTypeMapImage = "vehicleTypeMapImage"
    static let pricingType = "pricing_type"
    static let id = "id"
    static let countryAreaId = "country_area_id"
    static let extraSheetCharge = "extra_sheet_charge"
    static let createdAt = "created_at"
    static let vehicleTypeName = "vehicleTypeName"
    static let serviceTypeId = "service_type_id"
    static let freeTime = "free_time"
    static let freeDistance = "free_distance"
    static let priceCardValues = "price_card_values"
  }

  // MARK: Properties
  public var vehicleTypeImage: String?
  public var poolEnable: String?
  public var updatedAt: String?
  public var vehicleTypeDescription: String?
  public var vehicleTypeRank: String?
  public var vehicleTypeStatus: String?
  public var vehicleTypeId: String?
  public var baseFare: String?
  public var merchantId: String?
  public var vehicleTypeMapImage: String?
  public var pricingType: String?
  public var id: Int?
  public var countryAreaId: String?
  public var extraSheetCharge: String?
  public var createdAt: String?
  public var vehicleTypeName: String?
  public var serviceTypeId: String?
  public var freeTime: String?
  public var freeDistance: String?
  public var priceCardValues: [RateCardPriceCardValues]?

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
    vehicleTypeImage <- map[SerializationKeys.vehicleTypeImage]
    poolEnable <- map[SerializationKeys.poolEnable]
    updatedAt <- map[SerializationKeys.updatedAt]
    vehicleTypeDescription <- map[SerializationKeys.vehicleTypeDescription]
    vehicleTypeRank <- map[SerializationKeys.vehicleTypeRank]
    vehicleTypeStatus <- map[SerializationKeys.vehicleTypeStatus]
    vehicleTypeId <- map[SerializationKeys.vehicleTypeId]
    baseFare <- map[SerializationKeys.baseFare]
    merchantId <- map[SerializationKeys.merchantId]
    vehicleTypeMapImage <- map[SerializationKeys.vehicleTypeMapImage]
    pricingType <- map[SerializationKeys.pricingType]
    id <- map[SerializationKeys.id]
    countryAreaId <- map[SerializationKeys.countryAreaId]
    extraSheetCharge <- map[SerializationKeys.extraSheetCharge]
    createdAt <- map[SerializationKeys.createdAt]
    vehicleTypeName <- map[SerializationKeys.vehicleTypeName]
    serviceTypeId <- map[SerializationKeys.serviceTypeId]
    freeTime <- map[SerializationKeys.freeTime]
    freeDistance <- map[SerializationKeys.freeDistance]
    priceCardValues <- map[SerializationKeys.priceCardValues]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = vehicleTypeImage { dictionary[SerializationKeys.vehicleTypeImage] = value }
    if let value = poolEnable { dictionary[SerializationKeys.poolEnable] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = vehicleTypeDescription { dictionary[SerializationKeys.vehicleTypeDescription] = value }
    if let value = vehicleTypeRank { dictionary[SerializationKeys.vehicleTypeRank] = value }
    if let value = vehicleTypeStatus { dictionary[SerializationKeys.vehicleTypeStatus] = value }
    if let value = vehicleTypeId { dictionary[SerializationKeys.vehicleTypeId] = value }
    if let value = baseFare { dictionary[SerializationKeys.baseFare] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = vehicleTypeMapImage { dictionary[SerializationKeys.vehicleTypeMapImage] = value }
    if let value = pricingType { dictionary[SerializationKeys.pricingType] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = countryAreaId { dictionary[SerializationKeys.countryAreaId] = value }
    if let value = extraSheetCharge { dictionary[SerializationKeys.extraSheetCharge] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = vehicleTypeName { dictionary[SerializationKeys.vehicleTypeName] = value }
    if let value = serviceTypeId { dictionary[SerializationKeys.serviceTypeId] = value }
    if let value = freeTime { dictionary[SerializationKeys.freeTime] = value }
    if let value = freeDistance { dictionary[SerializationKeys.freeDistance] = value }
    if let value = priceCardValues { dictionary[SerializationKeys.priceCardValues] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
