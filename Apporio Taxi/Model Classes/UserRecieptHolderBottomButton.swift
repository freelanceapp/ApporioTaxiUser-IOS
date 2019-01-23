//
//  HolderBottomButton.swift
//
//  Created by Atul Jain on 22/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct UserRecieptHolderBottomButton: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let action = "action"
    static let textColor = "text_color"
    static let paymentData = "payment_data"
    static let text = "text"
    static let bottomButtonColor = "bottom_button_color"
  }

  // MARK: Properties
  public var action: String?
  public var textColor: String?
  public var paymentData: [UserRecieptPaymentData]?
  public var text: String?
  public var bottomButtonColor: String?

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
    action <- map[SerializationKeys.action]
    textColor <- map[SerializationKeys.textColor]
    paymentData <- map[SerializationKeys.paymentData]
    text <- map[SerializationKeys.text]
    bottomButtonColor <- map[SerializationKeys.bottomButtonColor]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = action { dictionary[SerializationKeys.action] = value }
    if let value = textColor { dictionary[SerializationKeys.textColor] = value }
    if let value = paymentData { dictionary[SerializationKeys.paymentData] = value.map { $0.dictionaryRepresentation() } }
    if let value = text { dictionary[SerializationKeys.text] = value }
    if let value = bottomButtonColor { dictionary[SerializationKeys.bottomButtonColor] = value }
    return dictionary
  }

}
