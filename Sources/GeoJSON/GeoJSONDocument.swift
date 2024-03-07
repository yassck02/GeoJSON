//
//  File.swift
//  GeoJSON
//
//  Created by Connor Yass on 3/6/24.
//

/// A GeoJSON document consisting of either a `Feature` or a `FeatureCollection`.
public enum GeoJSONDocument: Equatable, Codable {
  
  case feature(Feature)
  case featureCollection(FeatureCollection)
  
  private enum CodingKeys: String, CodingKey {
    case type
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let type = try container.decode(String.self, forKey: .type)
    switch type {
    case "Feature":
      self = .feature(try Feature(from: decoder))
    case "FeatureCollection":
      self = .featureCollection(try FeatureCollection(from: decoder))
    default:
      throw GeoJSONError.unexpectedRootType
    }
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    switch self {
    case .feature(let feature):
      try container.encode(feature)
    case .featureCollection(let featureCollection):
      try container.encode(featureCollection)
    }
  }
}
