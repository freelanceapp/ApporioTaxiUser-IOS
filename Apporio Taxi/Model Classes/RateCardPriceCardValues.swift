//
//  PriceCardValues.swift
//
//  Created by Atul Jain on 06/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RateCardPriceCardValues: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let priceCardId = "price_card_id"
    static let parameterType = "parameterType"
    static let updatedAt = "updated_at"
    static let id = "id"
    static let freeValue = "free_value"
    static let pricingParameterId = "pricing_parameter_id"
    static let createdAt = "created_at"
    static let descriptionValue = "description"
    static let parameterPrice = "parameter_price"
    static let parameterEdit = "parameter_edit"
    static let pricingParameter = "pricing_parameter"
  }

  // MARK: Properties
  public var priceCardId: Int?
  public var parameterType: Int?
  public var updatedAt: String?
  public var id: Int?
  public var freeValue: String?
  public var pricingParameterId: String?
  public var createdAt: String?
  public var descriptionValue: String?
  public var parameterPrice: String?
  public var parameterEdit: String?
  public var pricingParameter: String?

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
    priceCardId <- map[SerializationKeys.priceCardId]
    parameterType <- map[SerializationKeys.parameterType]
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    freeValue <- map[SerializationKeys.freeValue]
    pricingParameterId <- map[SerializationKeys.pricingParameterId]
    createdAt <- map[SerializationKeys.createdAt]
    descriptionValue <- map[SerializationKeys.descriptionValue]
    parameterPrice <- map[SerializationKeys.parameterPrice]
    parameterEdit <- map[SerializationKeys.parameterEdit]
    pricingParameter <- map[SerializationKeys.pricingParameter]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = priceCardId { dictionary[SerializationKeys.priceCardId] = value }
    if let value = parameterType { dictionary[SerializationKeys.parameterType] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = freeValue { dictionary[SerializationKeys.freeValue] = value }
    if let value = pricingParameterId { dictionary[SerializationKeys.pricingParameterId] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = parameterPrice { dictionary[SerializationKeys.parameterPrice] = value }
    if let value = parameterEdit { dictionary[SerializationKeys.parameterEdit] = value }
    if let value = pricingParameter { dictionary[SerializationKeys.pricingParameter] = value }
    return dictionary
  }

}
