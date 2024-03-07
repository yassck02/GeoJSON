//
//  File.swift
//  GeoJSON
//
//  Created by Connor Yass on 3/6/24.
//

import XCTest

extension XCTestCase {
  
  func jsonRepr<T: Encodable>(_ json: T, pretty: Bool = true) throws -> String {
    let encoder = JSONEncoder()
    if pretty {
      encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
    } else {
      encoder.outputFormatting = [.sortedKeys]
    }
    let data = try encoder.encode(json)
    return String(data: data, encoding: .utf8)!
  }
}
