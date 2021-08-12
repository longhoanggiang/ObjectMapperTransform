//
//  BooleanTransform.swift
//  ObjectMapperExtend
//
//  Created by Long Hoang Giang on 12/08/2021.
//

import ObjectMapper

public class BooleanTransform: TransformType {

  public typealias Object = Bool
  public typealias JSON = String
  
  public enum BooleanType {
    case truefalse
    case yesno
  }
  
  var type: BooleanType = .truefalse
  private var defaultEmptyValue: Bool?
  
  public init() {}
    
  public init(booleanType: BooleanType, emptyValue: Bool? = nil) {
    type = booleanType
    defaultEmptyValue = emptyValue
  }
  
  public func transformFromJSON(_ value: Any?) -> Bool? {
    if value is Bool { return (value as! Bool) }
    if value is Int { return (value as! Int) >= 1 }
    if value is String {
      if (value as! String).isEmpty, let emptyValue = defaultEmptyValue {
        return emptyValue
      }
      let valueString = (value as! String).lowercased()
      return valueString == "true" || valueString == "y" || valueString == "1"
    }
    return false
  }
  
  public func transformToJSON(_ value: Bool?) -> String? {
    let trueText = type == .truefalse ? "true" : "Y"
    let falseText = type == .truefalse ? "false" : "N"
    return (value ?? false) ? trueText : falseText
  }
  
}
