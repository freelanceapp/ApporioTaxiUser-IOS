//
//  Countries.swift
//
//  Created by Atul Jain on 01/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct UserConfigureCountries: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let updatedAt = "updated_at"
    static let distanceUnit = "distance_unit"
    static let defaultLanguage = "default_language"
    static let minNumPhone = "minNumPhone"
    static let isoCode = "isoCode"
    static let countryStatus = "country_status"
    static let merchantId = "merchant_id"
    static let maxNumPhone = "maxNumPhone"
    static let phonecode = "phonecode"
    static let id = "id"
    static let currency = "currency"
    static let createdAt = "created_at"
  }

  // MARK: Properties
  public var name: String?
  public var updatedAt: String?
  public var distanceUnit: String?
  public var defaultLanguage: String?
  public var minNumPhone: String?
  public var isoCode: String?
  public var countryStatus: String?
  public var merchantId: String?
  public var maxNumPhone: String?
  public var phonecode: String?
  public var id: Int?
  public var currency: String?
  public var createdAt: String?

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
    name <- map[SerializationKeys.name]
    updatedAt <- map[SerializationKeys.updatedAt]
    distanceUnit <- map[SerializationKeys.distanceUnit]
    defaultLanguage <- map[SerializationKeys.defaultLanguage]
    minNumPhone <- map[SerializationKeys.minNumPhone]
    isoCode <- map[SerializationKeys.isoCode]
    countryStatus <- map[SerializationKeys.countryStatus]
    merchantId <- map[SerializationKeys.merchantId]
    maxNumPhone <- map[SerializationKeys.maxNumPhone]
    phonecode <- map[SerializationKeys.phonecode]
    id <- map[SerializationKeys.id]
    currency <- map[SerializationKeys.currency]
    createdAt <- map[SerializationKeys.createdAt]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = distanceUnit { dictionary[SerializationKeys.distanceUnit] = value }
    if let value = defaultLanguage { dictionary[SerializationKeys.defaultLanguage] = value }
    if let value = minNumPhone { dictionary[SerializationKeys.minNumPhone] = value }
    if let value = isoCode { dictionary[SerializationKeys.isoCode] = value }
    if let value = countryStatus { dictionary[SerializationKeys.countryStatus] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = maxNumPhone { dictionary[SerializationKeys.maxNumPhone] = value }
    if let value = phonecode { dictionary[SerializationKeys.phonecode] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = currency { dictionary[SerializationKeys.currency] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    return dictionary
  }

}
