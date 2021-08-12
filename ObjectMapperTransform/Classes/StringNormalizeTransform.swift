//
//  StringNormalizeTransform.swift
//  ObjectMapperExtend
//
//  Created by Long Hoang Giang on 12/08/2021.
//

import ObjectMapper

public class StringNormalizeTransform: TransformType {
  public typealias Object = String
  public typealias JSON = String
  
  public init() {}
  
  public func transformFromJSON(_ value: Any?) -> String? {
    if value is Int {
      return "\(value as! Int)"
    }
    if value is UInt64 {
      return "\(value as! UInt64)"
    }
    if value is Double {
      return "\(value as! Double)"
    }
    if value is Float {
      return "\(value as! Float)"
    }
    if let valueString = value as? String {
      var normalizeValue = valueString.trimmingCharacters(in: .whitespacesAndNewlines)
      normalizeValue = replaceMatches(normalizeValue, pattern: "\\s{2,}", with: " ", options: .caseInsensitive)
      return  normalizeValue.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    return nil
  }
  
  public func transformToJSON(_ value: String?) -> String? {
    return value
  }
  
}

extension StringNormalizeTransform {
  
  private func replaceMatches(_ input: String,
                              pattern: String,
                              with replaceString: String = "",
                              options: NSRegularExpression.Options = [.caseInsensitive]) -> String {
    do {
      let regex = try NSRegularExpression(pattern: pattern, options: options)
      let range = NSMakeRange(0, input.utf16.count)
      return regex.stringByReplacingMatches(
        in: input,
        options: [],
        range: range,
        withTemplate: replaceString
      )
    } catch let e as NSError {
      print("replaceMatches: \(pattern), error: \(e.localizedDescription)")
    }
    return input
  }
  
}
