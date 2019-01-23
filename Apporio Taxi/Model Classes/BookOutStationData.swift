//
//  Data.swift
//
//  Created by Atul Jain on 05/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct BookOutStationData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let single = "single"
    static let round = "round"
  }

  // MARK: Properties
  public var single: [BookOutStationSingle]?
  public var round: [BookOutStationRound]?

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
    single <- map[SerializationKeys.single]
    round <- map[SerializationKeys.round]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
     if let value = single { dictionary[SerializationKeys.single] = value.map { $0.dictionaryRepresentation() } }
    if let value = round { dictionary[SerializationKeys.round] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
