//
//  Data.swift
//
//  Created by Atul Jain on 22/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct UserRecieptData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let holderDriverRating = "holder_driver_rating"
    static let holderRideInfo = "holder_ride_info"
    static let holderDriverFavourite = "holder_driver_favourite"
    static let holderBottomButton = "holder_bottom_button"
  }

  // MARK: Properties
  public var holderDriverRating: UserRecieptHolderDriverRating?
  public var holderRideInfo: UserRecieptHolderRideInfo?
  public var holderDriverFavourite: UserRecieptHolderDriverFavourite?
  public var holderBottomButton: UserRecieptHolderBottomButton?

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
    holderDriverRating <- map[SerializationKeys.holderDriverRating]
    holderRideInfo <- map[SerializationKeys.holderRideInfo]
    holderDriverFavourite <- map[SerializationKeys.holderDriverFavourite]
    holderBottomButton <- map[SerializationKeys.holderBottomButton]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = holderDriverRating { dictionary[SerializationKeys.holderDriverRating] = value.dictionaryRepresentation() }
    if let value = holderRideInfo { dictionary[SerializationKeys.holderRideInfo] = value.dictionaryRepresentation() }
    if let value = holderDriverFavourite { dictionary[SerializationKeys.holderDriverFavourite] = value.dictionaryRepresentation() }
    if let value = holderBottomButton { dictionary[SerializationKeys.holderBottomButton] = value.dictionaryRepresentation() }
    return dictionary
  }

}
