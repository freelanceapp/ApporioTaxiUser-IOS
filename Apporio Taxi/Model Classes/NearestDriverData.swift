//
//  Data.swift
//
//  Created by Atul Jain on 03/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct NearestDriverData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let statusForPool = "status_for_pool"
    static let vehicleImage = "vehicle_image"
    static let driverVerifyStatus = "driver_verify_status"
    static let bankName = "bank_name"
    static let vehicleTypeId = "vehicle_type_id"
    static let freeBusy = "free_busy"
    static let currentLatitude = "current_latitude"
    static let vehicleVerificationStatus = "vehicle_verification_status"
    static let id = "id"
    static let fullName = "fullName"
    static let playerId = "player_id"
    static let phoneNumber = "phoneNumber"
    static let driverId = "driver_id"
    static let rating = "rating"
    static let totalComanyEarning = "total_comany_earning"
    static let loginLogout = "login_logout"
    static let vehicleMakeId = "vehicle_make_id"
    static let countryAreaId = "country_area_id"
    static let createdAt = "created_at"
    static let onlineOffline = "online_offline"
    static let availSeats = "avail_seats"
    static let bearing = "bearing"
    static let occupiedSeats = "occupied_seats"
    static let homeLocationActive = "home_location_active"
    static let vehicleColor = "vehicle_color"
    static let vehicleModelId = "vehicle_model_id"
    static let profileImage = "profile_image"
    static let vehicleNumberPlateImage = "vehicle_number_plate_image"
    static let outstandAmount = "outstand_amount"
    static let password = "password"
    static let distance = "distance"
    static let vehicleNumber = "vehicle_number"
    static let walletMoney = "wallet_money"
    static let accountNumber = "account_number"
    static let signupStep = "signupStep"
    static let updatedAt = "updated_at"
    static let email = "email"
    static let currentLongitude = "current_longitude"
    static let signupFrom = "signupFrom"
    static let driverAdminStatus = "driver_admin_status"
    static let accuracy = "accuracy"
    static let merchantId = "merchant_id"
    static let poolRideActive = "pool_ride_active"
    static let accountHolderName = "account_holder_name"
    static let totalEarnings = "total_earnings"
    static let vehicleActiveStatus = "vehicle_active_status"
    static let driverVehicleId = "driver_vehicle_id"
    static let serviceTypeId = "service_type_id"
    static let accessTokenId = "access_token_id"
  }

  // MARK: Properties
  public var statusForPool: String?
  public var vehicleImage: String?
  public var driverVerifyStatus: String?
  public var bankName: String?
  public var vehicleTypeId: String?
  public var freeBusy: String?
  public var currentLatitude: String?
  public var vehicleVerificationStatus: String?
  public var id: Int?
  public var fullName: String?
  public var playerId: String?
  public var phoneNumber: String?
  public var driverId: String?
  public var rating: String?
  public var totalComanyEarning: String?
  public var loginLogout: String?
  public var vehicleMakeId: String?
  public var countryAreaId: String?
  public var createdAt: String?
  public var onlineOffline: String?
  public var availSeats: String?
  public var bearing: String?
  public var occupiedSeats: String?
  public var homeLocationActive: String?
  public var vehicleColor: String?
  public var vehicleModelId: String?
  public var profileImage: String?
  public var vehicleNumberPlateImage: String?
  public var outstandAmount: String?
  public var password: String?
  public var distance: String?
  public var vehicleNumber: String?
  public var walletMoney: String?
  public var accountNumber: String?
  public var signupStep: String?
  public var updatedAt: String?
  public var email: String?
  public var currentLongitude: String?
  public var signupFrom: String?
  public var driverAdminStatus: String?
  public var accuracy: String?
  public var merchantId: String?
  public var poolRideActive: String?
  public var accountHolderName: String?
  public var totalEarnings: String?
  public var vehicleActiveStatus: String?
  public var driverVehicleId: String?
  public var serviceTypeId: String?
  public var accessTokenId: String?

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
    statusForPool <- map[SerializationKeys.statusForPool]
    vehicleImage <- map[SerializationKeys.vehicleImage]
    driverVerifyStatus <- map[SerializationKeys.driverVerifyStatus]
    bankName <- map[SerializationKeys.bankName]
    vehicleTypeId <- map[SerializationKeys.vehicleTypeId]
    freeBusy <- map[SerializationKeys.freeBusy]
    currentLatitude <- map[SerializationKeys.currentLatitude]
    vehicleVerificationStatus <- map[SerializationKeys.vehicleVerificationStatus]
    id <- map[SerializationKeys.id]
    fullName <- map[SerializationKeys.fullName]
    playerId <- map[SerializationKeys.playerId]
    phoneNumber <- map[SerializationKeys.phoneNumber]
    driverId <- map[SerializationKeys.driverId]
    rating <- map[SerializationKeys.rating]
    totalComanyEarning <- map[SerializationKeys.totalComanyEarning]
    loginLogout <- map[SerializationKeys.loginLogout]
    vehicleMakeId <- map[SerializationKeys.vehicleMakeId]
    countryAreaId <- map[SerializationKeys.countryAreaId]
    createdAt <- map[SerializationKeys.createdAt]
    onlineOffline <- map[SerializationKeys.onlineOffline]
    availSeats <- map[SerializationKeys.availSeats]
    bearing <- map[SerializationKeys.bearing]
    occupiedSeats <- map[SerializationKeys.occupiedSeats]
    homeLocationActive <- map[SerializationKeys.homeLocationActive]
    vehicleColor <- map[SerializationKeys.vehicleColor]
    vehicleModelId <- map[SerializationKeys.vehicleModelId]
    profileImage <- map[SerializationKeys.profileImage]
    vehicleNumberPlateImage <- map[SerializationKeys.vehicleNumberPlateImage]
    outstandAmount <- map[SerializationKeys.outstandAmount]
    password <- map[SerializationKeys.password]
    distance <- map[SerializationKeys.distance]
    vehicleNumber <- map[SerializationKeys.vehicleNumber]
    walletMoney <- map[SerializationKeys.walletMoney]
    accountNumber <- map[SerializationKeys.accountNumber]
    signupStep <- map[SerializationKeys.signupStep]
    updatedAt <- map[SerializationKeys.updatedAt]
    email <- map[SerializationKeys.email]
    currentLongitude <- map[SerializationKeys.currentLongitude]
    signupFrom <- map[SerializationKeys.signupFrom]
    driverAdminStatus <- map[SerializationKeys.driverAdminStatus]
    accuracy <- map[SerializationKeys.accuracy]
    merchantId <- map[SerializationKeys.merchantId]
    poolRideActive <- map[SerializationKeys.poolRideActive]
    accountHolderName <- map[SerializationKeys.accountHolderName]
    totalEarnings <- map[SerializationKeys.totalEarnings]
    vehicleActiveStatus <- map[SerializationKeys.vehicleActiveStatus]
    driverVehicleId <- map[SerializationKeys.driverVehicleId]
    serviceTypeId <- map[SerializationKeys.serviceTypeId]
    accessTokenId <- map[SerializationKeys.accessTokenId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = statusForPool { dictionary[SerializationKeys.statusForPool] = value }
    if let value = vehicleImage { dictionary[SerializationKeys.vehicleImage] = value }
    if let value = driverVerifyStatus { dictionary[SerializationKeys.driverVerifyStatus] = value }
    if let value = bankName { dictionary[SerializationKeys.bankName] = value }
    if let value = vehicleTypeId { dictionary[SerializationKeys.vehicleTypeId] = value }
    if let value = freeBusy { dictionary[SerializationKeys.freeBusy] = value }
    if let value = currentLatitude { dictionary[SerializationKeys.currentLatitude] = value }
    if let value = vehicleVerificationStatus { dictionary[SerializationKeys.vehicleVerificationStatus] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = fullName { dictionary[SerializationKeys.fullName] = value }
    if let value = playerId { dictionary[SerializationKeys.playerId] = value }
    if let value = phoneNumber { dictionary[SerializationKeys.phoneNumber] = value }
    if let value = driverId { dictionary[SerializationKeys.driverId] = value }
    if let value = rating { dictionary[SerializationKeys.rating] = value }
    if let value = totalComanyEarning { dictionary[SerializationKeys.totalComanyEarning] = value }
    if let value = loginLogout { dictionary[SerializationKeys.loginLogout] = value }
    if let value = vehicleMakeId { dictionary[SerializationKeys.vehicleMakeId] = value }
    if let value = countryAreaId { dictionary[SerializationKeys.countryAreaId] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = onlineOffline { dictionary[SerializationKeys.onlineOffline] = value }
    if let value = availSeats { dictionary[SerializationKeys.availSeats] = value }
    if let value = bearing { dictionary[SerializationKeys.bearing] = value }
    if let value = occupiedSeats { dictionary[SerializationKeys.occupiedSeats] = value }
    if let value = homeLocationActive { dictionary[SerializationKeys.homeLocationActive] = value }
    if let value = vehicleColor { dictionary[SerializationKeys.vehicleColor] = value }
    if let value = vehicleModelId { dictionary[SerializationKeys.vehicleModelId] = value }
    if let value = profileImage { dictionary[SerializationKeys.profileImage] = value }
    if let value = vehicleNumberPlateImage { dictionary[SerializationKeys.vehicleNumberPlateImage] = value }
    if let value = outstandAmount { dictionary[SerializationKeys.outstandAmount] = value }
    if let value = password { dictionary[SerializationKeys.password] = value }
    if let value = distance { dictionary[SerializationKeys.distance] = value }
    if let value = vehicleNumber { dictionary[SerializationKeys.vehicleNumber] = value }
    if let value = walletMoney { dictionary[SerializationKeys.walletMoney] = value }
    if let value = accountNumber { dictionary[SerializationKeys.accountNumber] = value }
    if let value = signupStep { dictionary[SerializationKeys.signupStep] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = currentLongitude { dictionary[SerializationKeys.currentLongitude] = value }
    if let value = signupFrom { dictionary[SerializationKeys.signupFrom] = value }
    if let value = driverAdminStatus { dictionary[SerializationKeys.driverAdminStatus] = value }
    if let value = accuracy { dictionary[SerializationKeys.accuracy] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = poolRideActive { dictionary[SerializationKeys.poolRideActive] = value }
    if let value = accountHolderName { dictionary[SerializationKeys.accountHolderName] = value }
    if let value = totalEarnings { dictionary[SerializationKeys.totalEarnings] = value }
    if let value = vehicleActiveStatus { dictionary[SerializationKeys.vehicleActiveStatus] = value }
    if let value = driverVehicleId { dictionary[SerializationKeys.driverVehicleId] = value }
    if let value = serviceTypeId { dictionary[SerializationKeys.serviceTypeId] = value }
    if let value = accessTokenId { dictionary[SerializationKeys.accessTokenId] = value }
    return dictionary
  }

}
