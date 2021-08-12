//
//  IntegerTransform.swift
//  ObjectMapperExtend
//
//  Created by Long Hoang Giang on 12/08/2021.
//

import ObjectMapper

open class IntegerTransform: TransformType {
  
  public typealias Object = Int
  public typealias JSON = String
  
  public init() {}
  
  public func transformFromJSON(_ value: Any?) -> Int? {
    if value is Int { return value as? Int }
    if value is String {
      return Int(value as! String)
    }
    if value is Double {
      return Int(value as! Double)
    }
    return nil
  }
  
  public func transformToJSON(_ value: Int?) -> String? {
    return value != nil ? "\(value!)" : nil
  }
  
}
