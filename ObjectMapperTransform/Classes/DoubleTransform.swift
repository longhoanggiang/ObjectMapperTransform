//
//  DoubleTransform.swift
//  ObjectMapperExtend
//
//  Created by Long Hoang Giang on 12/08/2021.
//

import ObjectMapper

public class DoubleTransform: TransformType {
  
  public typealias Object = Double
  public typealias JSON = String
  private var valueFormat = "%f"
  
  public init() {}
  
  public convenience init(format: String) {
    self.init()
    valueFormat = format
  }
  
  public func transformFromJSON(_ value: Any?) -> Double? {
    if value is Double { return value as? Double }
    if value is String {
      return Double(value as! String)
    }
    if value is Int {
      return Double(value as! Int)
    }
    if value is Float {
      return Double(value as! Float)
    }
    return nil
  }
  
  public func transformToJSON(_ value: Double?) -> String? {
    return value != nil ? String(format: valueFormat, value!) : nil
  }
  
}
