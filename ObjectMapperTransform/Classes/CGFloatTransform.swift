//
//  CGFloatTransform.swift
//  ObjectMapperExtend
//
//  Created by Long Hoang Giang on 12/08/2021.
//

import ObjectMapper

public class CGFloatTransform: TransformType {
  
  public typealias Object = CGFloat
  public typealias JSON = String
  private var valueFormat = "%f"
  
  public init() {}
  
  public convenience init(format: String) {
    self.init()
    valueFormat = format
  }
  
  public func transformFromJSON(_ value: Any?) -> CGFloat? {
    if value is CGFloat { return value as? CGFloat }
    if value is Double { return CGFloat(value as! Double) }
    if value is Int { return CGFloat(value as! Int) }
    if value is Float { return CGFloat(value as! Float) }
    if value is String, let doubleVal = Double(value as! String) {
      return CGFloat(doubleVal)
    }
    return nil
  }
  
  public func transformToJSON(_ value: CGFloat?) -> String? {
    return value != nil ? String(format: valueFormat, value!) : "0"
  }
  
}
