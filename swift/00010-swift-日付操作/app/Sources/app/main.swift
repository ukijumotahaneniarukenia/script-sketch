import Foundation

let formatter = DateFormatter()


formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "EEEEE", options: 0, locale: Locale.current)
print(formatter.string(from: Date()))
formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "EEEE", options: 0, locale: Locale.current)
print(formatter.string(from: Date()))
formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "EEE", options: 0, locale: Locale.current)
print(formatter.string(from: Date()))
formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "EE", options: 0, locale: Locale.current)
print(formatter.string(from: Date()))
formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "E", options: 0, locale: Locale.current)
print(formatter.string(from: Date()))









var currentLocale=Locale(identifier: "ja_JP")

formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "E", options: 0, locale: currentLocale)
print(formatter.string(from: Date()))
formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "EE", options: 0, locale: currentLocale)
print(formatter.string(from: Date()))
formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "EEE", options: 0, locale: currentLocale)
print(formatter.string(from: Date()))
formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "EEEE", options: 0, locale: currentLocale)
print(formatter.string(from: Date()))
formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "EEEEE", options: 0, locale: currentLocale)
print(formatter.string(from: Date()))



formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ydMMM", options: 0, locale: currentLocale)
print(formatter.string(from: Date()) //2020年8月11日
