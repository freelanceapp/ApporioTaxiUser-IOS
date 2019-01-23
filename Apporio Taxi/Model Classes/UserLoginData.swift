//
//  Data.swift
//
//  Created by Atul Jain on 01/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct UserLoginData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let userStatus = "UserStatus"
    static let userName = "UserName"
    static let updatedAt = "updated_at"
    static let email = "email"
    static let userSignupFrom = "UserSignupFrom"
    static let rating = "rating"
    static let merchantId = "merchant_id"
    static let phoneVerified = "PhoneVerified"
    static let id = "id"
    static let emailVerified = "EmailVerified"
    static let referralCode = "ReferralCode"
    static let createdAt = "created_at"
    static let password = "password"
    static let userPhone = "UserPhone"
    static let userType = "user_type"
    static let userSignupType = "UserSignupType"
    static let manualUser = "manual_user"
    static let walletBalance = "wallet_balance"
    static let userprofileimage = "UserProfileImage"
  }

  // MARK: Properties
  public var userStatus: String?
  public var userName: String?
  public var updatedAt: String?
  public var email: String?
  public var userSignupFrom: String?
  public var rating: String?
  public var merchantId: String?
  public var phoneVerified: String?
  public var id: Int?
  public var emailVerified: String?
  public var referralCode: String?
  public var createdAt: String?
  public var password: String?
  public var userPhone: String?
  public var userType: String?
  public var userSignupType: String?
  public var manualUser: String?
  public var walletBalance: String?
    public var userprofileimage: String?

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
    userStatus <- map[SerializationKeys.userStatus]
    userName <- map[SerializationKeys.userName]
    updatedAt <- map[SerializationKeys.updatedAt]
    email <- map[SerializationKeys.email]
    userSignupFrom <- map[SerializationKeys.userSignupFrom]
    rating <- map[SerializationKeys.rating]
    merchantId <- map[SerializationKeys.merchantId]
    phoneVerified <- map[SerializationKeys.phoneVerified]
    id <- map[SerializationKeys.id]
    emailVerified <- map[SerializationKeys.emailVerified]
    referralCode <- map[SerializationKeys.referralCode]
    createdAt <- map[SerializationKeys.createdAt]
    password <- map[SerializationKeys.password]
    userPhone <- map[SerializationKeys.userPhone]
    userType <- map[SerializationKeys.userType]
    userSignupType <- map[SerializationKeys.userSignupType]
    manualUser <- map[SerializationKeys.manualUser]
    walletBalance <- map[SerializationKeys.walletBalance]
    userprofileimage <- map[SerializationKeys.userprofileimage]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = userStatus { dictionary[SerializationKeys.userStatus] = value }
    if let value = userName { dictionary[SerializationKeys.userName] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = userSignupFrom { dictionary[SerializationKeys.userSignupFrom] = value }
    if let value = rating { dictionary[SerializationKeys.rating] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = phoneVerified { dictionary[SerializationKeys.phoneVerified] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = emailVerified { dictionary[SerializationKeys.emailVerified] = value }
    if let value = referralCode { dictionary[SerializationKeys.referralCode] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = password { dictionary[SerializationKeys.password] = value }
    if let value = userPhone { dictionary[SerializationKeys.userPhone] = value }
    if let value = userType { dictionary[SerializationKeys.userType] = value }
    if let value = userSignupType { dictionary[SerializationKeys.userSignupType] = value }
    if let value = manualUser { dictionary[SerializationKeys.manualUser] = value }
    if let value = walletBalance { dictionary[SerializationKeys.walletBalance] = value }
    if let value = userprofileimage { dictionary[SerializationKeys.userprofileimage] = value }
    return dictionary
  }

}
