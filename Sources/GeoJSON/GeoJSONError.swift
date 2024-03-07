//
//  File.swift
//  GeoJSON
//
//  Created by Connor Yass on 3/6/24.
//

import Foundation

public enum GeoJSONError: Swift.Error {
  case unexpectedRootType
  case unexpectedValueCount
  case invalidCoordinateCount
  case openRing
  case unknownGeometryType
}
