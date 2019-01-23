//
//  PaymentOptionModel.swift
//
//  Created by Atul Jain on 02/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct PaymentOptionModel: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let creditButton = "credit_button"
    static let data = "data"
    static let message = "message"
    static let result = "result"
  }

  // MARK: Properties
  public var creditButton: Bool? = false
  public var data: [PaymentOptionData]?
  public var message: String?
  public var result: String?

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
    creditButton <- map[SerializationKeys.creditButton]
    data <- map[SerializationKeys.data]
    message <- map[SerializationKeys.message]
    result <- map[SerializationKeys.result]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.creditButton] = creditButton
    if let value = data { dictionary[SerializationKeys.data] = value.map { $0.dictionaryRepresentation() } }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = result { dictionary[SerializationKeys.result] = value }
    return dictionary
  }

}
