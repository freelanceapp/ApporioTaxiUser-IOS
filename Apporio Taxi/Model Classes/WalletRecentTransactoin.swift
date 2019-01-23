//
//  RecentTransactoin.swift
//
//  Created by Atul Jain on 27/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct WalletRecentTransactoin: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let icon = "icon"
    static let transactionName = "transaction_name"
    static let amount = "amount"
    static let valueColor = "value_color"
    static let type = "type"
    static let date = "date"
  }

  // MARK: Properties
  public var icon: String?
  public var transactionName: String?
  public var amount: String?
  public var valueColor: String?
  public var type: String?
  public var date: String?

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
    icon <- map[SerializationKeys.icon]
    transactionName <- map[SerializationKeys.transactionName]
    amount <- map[SerializationKeys.amount]
    valueColor <- map[SerializationKeys.valueColor]
    type <- map[SerializationKeys.type]
    date <- map[SerializationKeys.date]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = icon { dictionary[SerializationKeys.icon] = value }
    if let value = transactionName { dictionary[SerializationKeys.transactionName] = value }
    if let value = amount { dictionary[SerializationKeys.amount] = value }
    if let value = valueColor { dictionary[SerializationKeys.valueColor] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = date { dictionary[SerializationKeys.date] = value }
    return dictionary
  }

}
