//
//  PickdropLocationData.swift
//
//  Created by Atul Jain on 26/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RideDetailsPickdropLocationData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let pickText = "pick_text"
    static let pickTextVisibility = "pick_text_visibility"
    static let dropText = "drop_text"
    static let dropTextVisibility = "drop_text_visibility"
  }

  // MARK: Properties
  public var pickText: String?
  public var pickTextVisibility: Bool? = false
  public var dropText: String?
  public var dropTextVisibility: Bool? = false

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
    pickText <- map[SerializationKeys.pickText]
    pickTextVisibility <- map[SerializationKeys.pickTextVisibility]
    dropText <- map[SerializationKeys.dropText]
    dropTextVisibility <- map[SerializationKeys.dropTextVisibility]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = pickText { dictionary[SerializationKeys.pickText] = value }
    dictionary[SerializationKeys.pickTextVisibility] = pickTextVisibility
    if let value = dropText { dictionary[SerializationKeys.dropText] = value }
    dictionary[SerializationKeys.dropTextVisibility] = dropTextVisibility
    return dictionary
  }

}
