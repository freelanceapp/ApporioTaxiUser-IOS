//
//  Data.swift
//
//  Created by Atul Jain on 17/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RideNowCheckoutData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let dropLocation = "drop_location"
    static let pickupLocation = "pickup_location"
    static let autoUpgradetion = "auto_upgradetion"
    static let promoCode = "promo_code"
    static let dropLatitude = "drop_latitude"
    static let estimateBill = "estimate_bill"
    static let bookingType = "booking_type"
    static let vehicleTypeId = "vehicle_type_id"
    static let dropLongitude = "drop_longitude"
    static let selectedPaymentMethod = "SelectedPaymentMethod"
    static let cardId = "card_id"
    static let id = "id"
    static let estimateDistance = "estimate_distance"
    static let estimateTime = "estimate_time"
    static let promoHeading = "promo_heading"
    static let estimateDriverDistnace = "estimate_driver_distnace"
    static let priceCardId = "price_card_id"
    static let discountedAmout = "discounted_amout"
    static let packageId = "package_id"
    static let mapImage = "map_image"
    static let vehicleTypeImage = "vehicleTypeImage"
    static let updatedAt = "updated_at"
    static let pickupLongitude = "pickup_longitude"
    static let totalDropLocation = "total_drop_location"
    static let merchantId = "merchant_id"
    static let paymentMethodId = "payment_method_id"
    static let pickupLatitude = "pickup_latitude"
    static let estimateDriverTime = "estimate_driver_time"
    static let countryAreaId = "country_area_id"
    static let createdAt = "created_at"
    static let vehicleTypeName = "vehicleTypeName"
    static let serviceTypeId = "service_type_id"
    static let waypoints = "waypoints"
    static let userId = "user_id"
    static let estimatesHeaderText = "estimates_header_text"
    static let staticValues = "estimate_receipt"
  }

  // MARK: Properties
  public var dropLocation: String?
  public var pickupLocation: String?
  public var autoUpgradetion: Int?
  public var promoCode: String?
  public var dropLatitude: Float?
  public var estimateBill: String?
  public var bookingType: String?
  public var vehicleTypeId: String?
  public var dropLongitude: Float?
  public var selectedPaymentMethod: SelectedPaymentMethod?
  public var cardId: String?
  public var id: Int?
  public var estimateDistance: String?
  public var estimateTime: String?
  public var promoHeading: String?
  public var estimateDriverDistnace: String?
  public var priceCardId: Int?
  public var discountedAmout: String?
  public var packageId: String?
  public var mapImage: String?
  public var vehicleTypeImage: String?
  public var updatedAt: String?
  public var pickupLongitude: String?
  public var totalDropLocation: String?
  public var merchantId: String?
  public var paymentMethodId: String?
  public var pickupLatitude: String?
  public var estimateDriverTime: String?
  public var countryAreaId: String?
  public var createdAt: String?
  public var vehicleTypeName: String?
  public var serviceTypeId: String?
  public var waypoints: String?
  public var userId: String?
  public var estimatesHeaderText: String?
     public var staticValues: [UserRecieptStaticValues]?

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
    dropLocation <- map[SerializationKeys.dropLocation]
    pickupLocation <- map[SerializationKeys.pickupLocation]
    autoUpgradetion <- map[SerializationKeys.autoUpgradetion]
    promoCode <- map[SerializationKeys.promoCode]
    dropLatitude <- map[SerializationKeys.dropLatitude]
    estimateBill <- map[SerializationKeys.estimateBill]
    bookingType <- map[SerializationKeys.bookingType]
    vehicleTypeId <- map[SerializationKeys.vehicleTypeId]
    dropLongitude <- map[SerializationKeys.dropLongitude]
    selectedPaymentMethod <- map[SerializationKeys.selectedPaymentMethod]
    cardId <- map[SerializationKeys.cardId]
    id <- map[SerializationKeys.id]
    estimateDistance <- map[SerializationKeys.estimateDistance]
    estimateTime <- map[SerializationKeys.estimateTime]
    promoHeading <- map[SerializationKeys.promoHeading]
    estimateDriverDistnace <- map[SerializationKeys.estimateDriverDistnace]
    priceCardId <- map[SerializationKeys.priceCardId]
    discountedAmout <- map[SerializationKeys.discountedAmout]
    packageId <- map[SerializationKeys.packageId]
    mapImage <- map[SerializationKeys.mapImage]
    vehicleTypeImage <- map[SerializationKeys.vehicleTypeImage]
    updatedAt <- map[SerializationKeys.updatedAt]
    pickupLongitude <- map[SerializationKeys.pickupLongitude]
    totalDropLocation <- map[SerializationKeys.totalDropLocation]
    merchantId <- map[SerializationKeys.merchantId]
    paymentMethodId <- map[SerializationKeys.paymentMethodId]
    pickupLatitude <- map[SerializationKeys.pickupLatitude]
    estimateDriverTime <- map[SerializationKeys.estimateDriverTime]
    countryAreaId <- map[SerializationKeys.countryAreaId]
    createdAt <- map[SerializationKeys.createdAt]
    vehicleTypeName <- map[SerializationKeys.vehicleTypeName]
    serviceTypeId <- map[SerializationKeys.serviceTypeId]
    waypoints <- map[SerializationKeys.waypoints]
    userId <- map[SerializationKeys.userId]
    estimatesHeaderText <- map[SerializationKeys.estimatesHeaderText]
    staticValues <- map[SerializationKeys.staticValues]


  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = dropLocation { dictionary[SerializationKeys.dropLocation] = value }
    if let value = pickupLocation { dictionary[SerializationKeys.pickupLocation] = value }
    if let value = autoUpgradetion { dictionary[SerializationKeys.autoUpgradetion] = value }
    if let value = promoCode { dictionary[SerializationKeys.promoCode] = value }
    if let value = dropLatitude { dictionary[SerializationKeys.dropLatitude] = value }
    if let value = estimateBill { dictionary[SerializationKeys.estimateBill] = value }
    if let value = bookingType { dictionary[SerializationKeys.bookingType] = value }
    if let value = vehicleTypeId { dictionary[SerializationKeys.vehicleTypeId] = value }
    if let value = dropLongitude { dictionary[SerializationKeys.dropLongitude] = value }
    if let value = selectedPaymentMethod { dictionary[SerializationKeys.selectedPaymentMethod] = value.dictionaryRepresentation() }
    if let value = cardId { dictionary[SerializationKeys.cardId] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = estimateDistance { dictionary[SerializationKeys.estimateDistance] = value }
    if let value = estimateTime { dictionary[SerializationKeys.estimateTime] = value }
    if let value = promoHeading { dictionary[SerializationKeys.promoHeading] = value }
    if let value = estimateDriverDistnace { dictionary[SerializationKeys.estimateDriverDistnace] = value }
    if let value = priceCardId { dictionary[SerializationKeys.priceCardId] = value }
    if let value = discountedAmout { dictionary[SerializationKeys.discountedAmout] = value }
    if let value = packageId { dictionary[SerializationKeys.packageId] = value }
    if let value = mapImage { dictionary[SerializationKeys.mapImage] = value }
    if let value = vehicleTypeImage { dictionary[SerializationKeys.vehicleTypeImage] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = pickupLongitude { dictionary[SerializationKeys.pickupLongitude] = value }
    if let value = totalDropLocation { dictionary[SerializationKeys.totalDropLocation] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = paymentMethodId { dictionary[SerializationKeys.paymentMethodId] = value }
    if let value = pickupLatitude { dictionary[SerializationKeys.pickupLatitude] = value }
    if let value = estimateDriverTime { dictionary[SerializationKeys.estimateDriverTime] = value }
    if let value = countryAreaId { dictionary[SerializationKeys.countryAreaId] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = vehicleTypeName { dictionary[SerializationKeys.vehicleTypeName] = value }
    if let value = serviceTypeId { dictionary[SerializationKeys.serviceTypeId] = value }
    if let value = waypoints { dictionary[SerializationKeys.waypoints] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = estimatesHeaderText { dictionary[SerializationKeys.estimatesHeaderText] = value }
    if let value = staticValues { dictionary[SerializationKeys.staticValues] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
