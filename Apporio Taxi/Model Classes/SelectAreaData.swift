//
//  Data.swift
//
//  Created by Atul Jain on 07/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct SelectAreaData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let updatedAt = "updated_at"
    static let id = "id"
    static let timezone = "timezone"
    static let autoUpgradetion = "auto_upgradetion"
    static let createdAt = "created_at"
    static let areaName = "AreaName"
    static let countryId = "country_id"
    static let merchantId = "merchant_id"
    static let areaCoordinates = "AreaCoordinates"
  }

  // MARK: Properties
  public var updatedAt: String?
  public var id: Int?
  public var timezone: String?
  public var autoUpgradetion: String?
  public var createdAt: String?
  public var areaName: String?
  public var countryId: String?
  public var merchantId: String?
  public var areaCoordinates: String?

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
    timezone <- map[SerializationKeys.timezone]
    autoUpgradetion <- map[SerializationKeys.autoUpgradetion]
    createdAt <- map[SerializationKeys.createdAt]
    areaName <- map[SerializationKeys.areaName]
    countryId <- map[SerializationKeys.countryId]
    merchantId <- map[SerializationKeys.merchantId]
    areaCoordinates <- map[SerializationKeys.areaCoordinates]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = timezone { dictionary[SerializationKeys.timezone] = value }
    if let value = autoUpgradetion { dictionary[SerializationKeys.autoUpgradetion] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = areaName { dictionary[SerializationKeys.areaName] = value }
    if let value = countryId { dictionary[SerializationKeys.countryId] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = areaCoordinates { dictionary[SerializationKeys.areaCoordinates] = value }
    return dictionary
  }

}
