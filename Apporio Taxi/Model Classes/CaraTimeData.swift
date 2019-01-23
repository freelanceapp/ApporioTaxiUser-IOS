//
//  Data.swift
//
//  Created by Atul Jain on 11/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct CarsTimeData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let updatedAt = "updated_at"
    static let id = "id"
    static let autoUpgradetion = "auto_upgradetion"
    static let createdAt = "created_at"
    static let countryId = "country_id"
    static let serviceTypes = "service_types"
    static let merchantId = "merchant_id"
    static let areaCoordinates = "AreaCoordinates"
     static let areaCoordinatesIos = "AreaCoordinatesIos"
  }

  // MARK: Properties
  public var updatedAt: String?
  public var id: Int?
  public var autoUpgradetion: String?
  public var createdAt: String?
  public var countryId: String?
  public var serviceTypes: [CarsTimeServiceTypes]?
  public var merchantId: String?
  public var areaCoordinates: String?
   public var areaCoordinatesIos: [AreaData]?

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
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    autoUpgradetion <- map[SerializationKeys.autoUpgradetion]
    createdAt <- map[SerializationKeys.createdAt]
    countryId <- map[SerializationKeys.countryId]
    serviceTypes <- map[SerializationKeys.serviceTypes]
    merchantId <- map[SerializationKeys.merchantId]
    areaCoordinates <- map[SerializationKeys.areaCoordinates]
     areaCoordinatesIos <- map[SerializationKeys.areaCoordinatesIos]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = autoUpgradetion { dictionary[SerializationKeys.autoUpgradetion] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = countryId { dictionary[SerializationKeys.countryId] = value }
    if let value = serviceTypes { dictionary[SerializationKeys.serviceTypes] = value.map { $0.dictionaryRepresentation() } }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = areaCoordinates { dictionary[SerializationKeys.areaCoordinates] = value }
      if let value = areaCoordinatesIos { dictionary[SerializationKeys.areaCoordinatesIos] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
