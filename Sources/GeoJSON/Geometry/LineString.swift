//
//  File.swift
//  GeoJSON
//
//  Created by Connor Yass on 3/6/24.
//

/// A string of two or more `Position`s.
public struct LineString: Equatable, Codable {
  
  public var coordinates: [Position]
  
  public init(coordinates: [Position]) {
    self.coordinates = coordinates
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    self.coordinates = try container.decode([Position].self)
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(coordinates)
  }
}
