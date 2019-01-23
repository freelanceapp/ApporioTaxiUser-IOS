//
//  UserData.swift
//
//  Created by Atul Jain on 26/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RideDetailsUserData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let highlightedText = "highlighted_text"
    static let ratingButtonEnable = "rating_button_enable"
    static let ratingButtonTextStyle = "rating_button_text_style"
    static let ratingButtonTextColor = "rating_button_text_color"
    static let rating = "rating"
    static let smallText = "small_text"
    static let ratingButtonText = "rating_button_text"
    static let ratingVisibility = "rating_visibility"
    static let ratingButtonVisibility = "rating_button_visibility"
    static let circularimage = "circular_image"
    
  }

  // MARK: Properties
  public var highlightedText: String?
  public var ratingButtonEnable: Bool? = false
  public var ratingButtonTextStyle: String?
  public var ratingButtonTextColor: String?
  public var rating: String?
  public var smallText: String?
  public var ratingButtonText: String?
  public var ratingVisibility: Bool? = false
  public var ratingButtonVisibility: Bool? = false
    public var circularimage: String?

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
    highlightedText <- map[SerializationKeys.highlightedText]
    ratingButtonEnable <- map[SerializationKeys.ratingButtonEnable]
    ratingButtonTextStyle <- map[SerializationKeys.ratingButtonTextStyle]
    ratingButtonTextColor <- map[SerializationKeys.ratingButtonTextColor]
    rating <- map[SerializationKeys.rating]
    smallText <- map[SerializationKeys.smallText]
    ratingButtonText <- map[SerializationKeys.ratingButtonText]
    ratingVisibility <- map[SerializationKeys.ratingVisibility]
    ratingButtonVisibility <- map[SerializationKeys.ratingButtonVisibility]
    circularimage <- map[SerializationKeys.circularimage]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = highlightedText { dictionary[SerializationKeys.highlightedText] = value }
    dictionary[SerializationKeys.ratingButtonEnable] = ratingButtonEnable
    if let value = ratingButtonTextStyle { dictionary[SerializationKeys.ratingButtonTextStyle] = value }
    if let value = ratingButtonTextColor { dictionary[SerializationKeys.ratingButtonTextColor] = value }
    if let value = rating { dictionary[SerializationKeys.rating] = value }
    if let value = smallText { dictionary[SerializationKeys.smallText] = value }
    if let value = ratingButtonText { dictionary[SerializationKeys.ratingButtonText] = value }
    dictionary[SerializationKeys.ratingVisibility] = ratingVisibility
    dictionary[SerializationKeys.ratingButtonVisibility] = ratingButtonVisibility
     if let value = circularimage { dictionary[SerializationKeys.circularimage] = value }
    return dictionary
  }

}
