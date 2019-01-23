//
//  Driver.swift
//
//  Created by Atul Jain on 03/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ViewFavouriteDriver: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let bearing = "bearing"
    static let statusForPool = "status_for_pool"
    static let driverVerifyStatus = "driver_verify_status"
    static let bankName = "bank_name"
    static let profileImage = "profile_image"
    static let outstandAmount = "outstand_amount"
    static let freeBusy = "free_busy"
    static let currentLatitude = "current_latitude"
    static let fullName = "fullName"
    static let id = "id"
    static let password = "password"
    static let playerId = "player_id"
    static let walletMoney = "wallet_money"
    static let accountNumber = "account_number"
    static let signupStep = "signupStep"
    static let email = "email"
    static let phoneNumber = "phoneNumber"
    static let currentLongitude = "current_longitude"
    static let signupFrom = "signupFrom"
    static let driverAdminStatus = "driver_admin_status"
    static let updatedAt = "updated_at"
    static let rating = "rating"
    static let accuracy = "accuracy"
    static let merchantId = "merchant_id"
    static let accountHolderName = "account_holder_name"
    static let totalComanyEarning = "total_comany_earning"
    static let loginLogout = "login_logout"
    static let poolRideActive = "pool_ride_active"
    static let totalEarnings = "total_earnings"
    static let countryAreaId = "country_area_id"
    static let createdAt = "created_at"
    static let onlineOffline = "online_offline"
    static let accessTokenId = "access_token_id"
    static let homeLocationActive = "home_location_active"
  }

  // MARK: Properties
  public var bearing: String?
  public var statusForPool: String?
  public var driverVerifyStatus: String?
  public var bankName: String?
  public var profileImage: String?
  public var outstandAmount: String?
  public var freeBusy: String?
  public var currentLatitude: String?
  public var fullName: String?
  public var id: Int?
  public var password: String?
  public var playerId: String?
  public var walletMoney: String?
  public var accountNumber: String?
  public var signupStep: String?
  public var email: String?
  public var phoneNumber: String?
  public var currentLongitude: String?
  public var signupFrom: String?
  public var driverAdminStatus: String?
  public var updatedAt: String?
  public var rating: String?
  public var accuracy: String?
  public var merchantId: String?
  public var accountHolderName: String?
  public var totalComanyEarning: String?
  public var loginLogout: String?
  public var poolRideActive: String?
  public var totalEarnings: String?
  public var countryAreaId: String?
  public var createdAt: String?
  public var onlineOffline: String?
  public var accessTokenId: String?
  public var homeLocationActive: String?

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
    bearing <- map[SerializationKeys.bearing]
    statusForPool <- map[SerializationKeys.statusForPool]
    driverVerifyStatus <- map[SerializationKeys.driverVerifyStatus]
    bankName <- map[SerializationKeys.bankName]
    profileImage <- map[SerializationKeys.profileImage]
    outstandAmount <- map[SerializationKeys.outstandAmount]
    freeBusy <- map[SerializationKeys.freeBusy]
    currentLatitude <- map[SerializationKeys.currentLatitude]
    fullName <- map[SerializationKeys.fullName]
    id <- map[SerializationKeys.id]
    password <- map[SerializationKeys.password]
    playerId <- map[SerializationKeys.playerId]
    walletMoney <- map[SerializationKeys.walletMoney]
    accountNumber <- map[SerializationKeys.accountNumber]
    signupStep <- map[SerializationKeys.signupStep]
    email <- map[SerializationKeys.email]
    phoneNumber <- map[SerializationKeys.phoneNumber]
    currentLongitude <- map[SerializationKeys.currentLongitude]
    signupFrom <- map[SerializationKeys.signupFrom]
    driverAdminStatus <- map[SerializationKeys.driverAdminStatus]
    updatedAt <- map[SerializationKeys.updatedAt]
    rating <- map[SerializationKeys.rating]
    accuracy <- map[SerializationKeys.accuracy]
    merchantId <- map[SerializationKeys.merchantId]
    accountHolderName <- map[SerializationKeys.accountHolderName]
    totalComanyEarning <- map[SerializationKeys.totalComanyEarning]
    loginLogout <- map[SerializationKeys.loginLogout]
    poolRideActive <- map[SerializationKeys.poolRideActive]
    totalEarnings <- map[SerializationKeys.totalEarnings]
    countryAreaId <- map[SerializationKeys.countryAreaId]
    createdAt <- map[SerializationKeys.createdAt]
    onlineOffline <- map[SerializationKeys.onlineOffline]
    accessTokenId <- map[SerializationKeys.accessTokenId]
    homeLocationActive <- map[SerializationKeys.homeLocationActive]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = bearing { dictionary[SerializationKeys.bearing] = value }
    if let value = statusForPool { dictionary[SerializationKeys.statusForPool] = value }
    if let value = driverVerifyStatus { dictionary[SerializationKeys.driverVerifyStatus] = value }
    if let value = bankName { dictionary[SerializationKeys.bankName] = value }
    if let value = profileImage { dictionary[SerializationKeys.profileImage] = value }
    if let value = outstandAmount { dictionary[SerializationKeys.outstandAmount] = value }
    if let value = freeBusy { dictionary[SerializationKeys.freeBusy] = value }
    if let value = currentLatitude { dictionary[SerializationKeys.currentLatitude] = value }
    if let value = fullName { dictionary[SerializationKeys.fullName] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = password { dictionary[SerializationKeys.password] = value }
    if let value = playerId { dictionary[SerializationKeys.playerId] = value }
    if let value = walletMoney { dictionary[SerializationKeys.walletMoney] = value }
    if let value = accountNumber { dictionary[SerializationKeys.accountNumber] = value }
    if let value = signupStep { dictionary[SerializationKeys.signupStep] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = phoneNumber { dictionary[SerializationKeys.phoneNumber] = value }
    if let value = currentLongitude { dictionary[SerializationKeys.currentLongitude] = value }
    if let value = signupFrom { dictionary[SerializationKeys.signupFrom] = value }
    if let value = driverAdminStatus { dictionary[SerializationKeys.driverAdminStatus] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = rating { dictionary[SerializationKeys.rating] = value }
    if let value = accuracy { dictionary[SerializationKeys.accuracy] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = accountHolderName { dictionary[SerializationKeys.accountHolderName] = value }
    if let value = totalComanyEarning { dictionary[SerializationKeys.totalComanyEarning] = value }
    if let value = loginLogout { dictionary[SerializationKeys.loginLogout] = value }
    if let value = poolRideActive { dictionary[SerializationKeys.poolRideActive] = value }
    if let value = totalEarnings { dictionary[SerializationKeys.totalEarnings] = value }
    if let value = countryAreaId { dictionary[SerializationKeys.countryAreaId] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = onlineOffline { dictionary[SerializationKeys.onlineOffline] = value }
    if let value = accessTokenId { dictionary[SerializationKeys.accessTokenId] = value }
    if let value = homeLocationActive { dictionary[SerializationKeys.homeLocationActive] = value }
    return dictionary
  }

}
