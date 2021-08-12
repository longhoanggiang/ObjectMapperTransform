//
//  GDateTransform.swift
//  ObjectMapperExtend
//
//  Created by Long Hoang Giang on 12/08/2021.
//

import ObjectMapper

public class GDateTransform: TransformType {
  
  public typealias Object = Date
  public typealias JSON = String
  
  private let format: String?
  private let locale: Locale?

  public init(format: String, locale: Locale? = nil) {
    self.format = format
    self.locale = locale
  }
  
  public func transformFromJSON(_ value: Any?) -> Date? {
    guard let dateString = value as? String, let format = format else { return nil }
    return dateFromString(dateString, format: format, locale: locale)
  }
  
  public func transformToJSON(_ value: Date?) -> String? {
    if let date = value, let format = format {
      return dateToString(date, format: format, locale: locale)
    }
    return nil
  }
}

extension GDateTransform {
  
  private func dateFromString(_ string: String?, format: String, locale: Locale? = nil) -> Date? {
    guard let string = string else { return nil }
    let formatter = DateFormatter()
    formatter.dateFormat = format
    formatter.calendar = Calendar(identifier: .iso8601)
    if let locale = locale {
      formatter.locale = locale
    }
    let result = formatter.date(from: string)
    return result
  }
  
  private func dateToString(_ date: Date, format: String, locale: Locale? = nil) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    formatter.calendar = Calendar(identifier: .iso8601)
    if let locale = locale {
      formatter.locale = locale
    }
    let result = formatter.string(from: date)
    return result
  }
  
}
