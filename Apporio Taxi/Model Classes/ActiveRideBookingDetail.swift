//
//  BookingDetail.swift
//
//  Created by Atul Jain on 20/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ActiveRideBookingDetail: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let endLatitude = "end_latitude"
    static let accuracyAtAccept = "accuracy_at_accept"
    static let acceptTimestamp = "accept_timestamp"
    static let id = "id"
    static let acceptLongitude = "accept_longitude"
    static let promoDiscount = "promo_discount"
    static let acceptLatitude = "accept_latitude"
    static let walletDeductMoney = "wallet_deduct_money"
    static let bookingId = "booking_id"
    static let updatedAt = "updated_at"
    static let pendingAmount = "pending_amount"
    static let totalAmount = "total_amount"
    static let accuracyAtEnd = "accuracy_at_end"
    static let endTimestamp = "end_timestamp"
    static let createdAt = "created_at"
    static let endLongitude = "end_longitude"
  }

  // MARK: Properties
  public var endLatitude: String?
  public var accuracyAtAccept: String?
  public var acceptTimestamp: String?
  public var id: Int?
  public var acceptLongitude: String?
  public var promoDiscount: String?
  public var acceptLatitude: String?
  public var walletDeductMoney: String?
  public var bookingId: String?
  public var updatedAt: String?
  public var pendingAmount: String?
  public var totalAmount: String?
  public var accuracyAtEnd: String?
  public var endTimestamp: String?
  public var createdAt: String?
  public var endLongitude: String?

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
    endLatitude <- map[SerializationKeys.endLatitude]
    accuracyAtAccept <- map[SerializationKeys.accuracyAtAccept]
    acceptTimestamp <- map[SerializationKeys.acceptTimestamp]
    id <- map[SerializationKeys.id]
    acceptLongitude <- map[SerializationKeys.acceptLongitude]
    promoDiscount <- map[SerializationKeys.promoDiscount]
    acceptLatitude <- map[SerializationKeys.acceptLatitude]
    walletDeductMoney <- map[SerializationKeys.walletDeductMoney]
    bookingId <- map[SerializationKeys.bookingId]
    updatedAt <- map[SerializationKeys.updatedAt]
    pendingAmount <- map[SerializationKeys.pendingAmount]
    totalAmount <- map[SerializationKeys.totalAmount]
    accuracyAtEnd <- map[SerializationKeys.accuracyAtEnd]
    endTimestamp <- map[SerializationKeys.endTimestamp]
    createdAt <- map[SerializationKeys.createdAt]
    endLongitude <- map[SerializationKeys.endLongitude]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = endLatitude { dictionary[SerializationKeys.endLatitude] = value }
    if let value = accuracyAtAccept { dictionary[SerializationKeys.accuracyAtAccept] = value }
    if let value = acceptTimestamp { dictionary[SerializationKeys.acceptTimestamp] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = acceptLongitude { dictionary[SerializationKeys.acceptLongitude] = value }
    if let value = promoDiscount { dictionary[SerializationKeys.promoDiscount] = value }
    if let value = acceptLatitude { dictionary[SerializationKeys.acceptLatitude] = value }
    if let value = walletDeductMoney { dictionary[SerializationKeys.walletDeductMoney] = value }
    if let value = bookingId { dictionary[SerializationKeys.bookingId] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = pendingAmount { dictionary[SerializationKeys.pendingAmount] = value }
    if let value = totalAmount { dictionary[SerializationKeys.totalAmount] = value }
    if let value = accuracyAtEnd { dictionary[SerializationKeys.accuracyAtEnd] = value }
    if let value = endTimestamp { dictionary[SerializationKeys.endTimestamp] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = endLongitude { dictionary[SerializationKeys.endLongitude] = value }
    return dictionary
  }

}
