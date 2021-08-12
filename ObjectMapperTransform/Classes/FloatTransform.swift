//
//  FloatTransform.swift
//  ObjectMapperTransform
//
//  Created by Long Hoang Giang on 13/08/2021.
//

import ObjectMapper

public class FloatTransform: TransformType {
  
  public typealias Object = Float
  public typealias JSON = String
  private var valueFormat = "%f"
  
  public init() {}
  
  public convenience init(format: String) {
    self.init()
    valueFormat = format
  }
  
  public func transformFromJSON(_ value: Any?) -> Float? {
    if value is Float { return value as? Float }
    if value is Double { return Float(value as! Double) }
    if value is Int { return Float(value as! Int) }
    if value is Float { return Float(value as! Float) }
    if value is String, let doubleVal = Double(value as! String) {
      return Float(doubleVal)
    }
    return nil
  }
  
  public func transformToJSON(_ value: Float?) -> String? {
    return value != nil ? String(format: valueFormat, value!) : "0"
  }
  
}
