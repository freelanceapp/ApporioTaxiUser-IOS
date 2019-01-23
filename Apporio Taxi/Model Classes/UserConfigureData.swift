//
//  Data.swift
//
//  Created by Atul Jain on 01/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct UserConfigureData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let countries = "countries"
    static let appVersionDialog = "app_version_dialog"
    static let userWalletPackage = "user_wallet_package"
    static let customerSupport = "customer_support"
    static let defaultLanguage = "default_language"
    static let rideLate = "ride_late"
    static let languages = "languages"
    static let appMaintainance = "app_maintainance"
    static let Demo = "demo"
    static let Multidestination = "multi_destination"
    static let Totaldistination = "total_distination"
    static let gender = "gender"
  }

  // MARK: Properties
  public var countries: [UserConfigureCountries]?
  public var appVersionDialog: UserConfigureAppVersionDialog?
  public var userWalletPackage: [UserConfigureUserWalletPackage]?
  public var customerSupport: UserConfigureCustomerSupport?
  public var defaultLanguage: String?
  public var rideLate: UserConfigureRideLate?
  public var languages: [UserConfigureLanguages]?
  public var appMaintainance: UserConfigureAppMaintainance?
    public var Demo: String?
    public var Multidestination: Bool? = false
    public var Totaldistination: String?
    public var gender: String?


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
    countries <- map[SerializationKeys.countries]
    appVersionDialog <- map[SerializationKeys.appVersionDialog]
    userWalletPackage <- map[SerializationKeys.userWalletPackage]
    customerSupport <- map[SerializationKeys.customerSupport]
    defaultLanguage <- map[SerializationKeys.defaultLanguage]
    rideLate <- map[SerializationKeys.rideLate]
    languages <- map[SerializationKeys.languages]
    appMaintainance <- map[SerializationKeys.appMaintainance]
    Demo <- map[SerializationKeys.Demo]
    Multidestination <- map[SerializationKeys.Multidestination]
     Totaldistination <- map[SerializationKeys.Totaldistination]
    gender <- map[SerializationKeys.gender]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = countries { dictionary[SerializationKeys.countries] = value.map { $0.dictionaryRepresentation() } }
    if let value = appVersionDialog { dictionary[SerializationKeys.appVersionDialog] = value.dictionaryRepresentation() }
    if let value = userWalletPackage { dictionary[SerializationKeys.userWalletPackage] = value.map { $0.dictionaryRepresentation() } }
    if let value = customerSupport { dictionary[SerializationKeys.customerSupport] = value.dictionaryRepresentation() }
    if let value = defaultLanguage { dictionary[SerializationKeys.defaultLanguage] = value }
    if let value = rideLate { dictionary[SerializationKeys.rideLate] = value.dictionaryRepresentation() }
    if let value = languages { dictionary[SerializationKeys.languages] = value.map { $0.dictionaryRepresentation() } }
    if let value = appMaintainance { dictionary[SerializationKeys.appMaintainance] = value.dictionaryRepresentation() }
     if let value = Demo { dictionary[SerializationKeys.Demo] = value }
    dictionary[SerializationKeys.Multidestination] = Multidestination
     if let value = Totaldistination { dictionary[SerializationKeys.Totaldistination] = value }
    if let value = gender { dictionary[SerializationKeys.gender] = value }
    return dictionary
  }

}
