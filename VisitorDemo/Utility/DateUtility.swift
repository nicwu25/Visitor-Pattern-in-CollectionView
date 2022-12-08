//
//  DateUtility.swift
//  LanguageProductionLine
//
//  Created by cm0678 on 2022/2/21.
//

import Foundation

class DateUtility {
    
    /// Apple 文件說 DateFormatter init 很貴,使用 static 存起來
    static let dateFormatter = DateFormatter()
    
    static let dateComponentsFormatter = DateComponentsFormatter()
    
    private let kWeekDays = [
        1: "日",
        2: "一",
        3: "二",
        4: "三",
        5: "四",
        6: "五",
        7: "六"
    ]
    
    var timeZone: TimeZone {
        
        return TimeZone(identifier: "Asia/Taipei") ?? TimeZone.current
    }
    
    func getDate(by component: Calendar.Component, value: Int, to date: Date = Date()) -> Date? {
        
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        
        return calendar.date(byAdding: component, value: value, to: date)
    }
    
    /// 輸入 年 月 日, 如果是合法日期, return Date, 不然 return nil
    /// - Parameters:
    ///   - year: 年: Int
    ///   - month: 月: Int
    ///   - day: 日: Int
    func getDateFrom(year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) -> Date? {
        
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        
        var compoenents = DateComponents()
        compoenents.calendar = calendar
        compoenents.year = year
        compoenents.month = month
        compoenents.day = day
        compoenents.hour = hour
        compoenents.minute = minute
        compoenents.second = second
        
        if compoenents.isValidDate == false {
            return nil
        }
        return compoenents.date
    }
    
    /// return dateComponents,預設值為 年 月 日 時 分 秒, 可以改
    /// - Parameters:
    ///   - date: 目標 Date
    ///   - dateComponents: 預設值為 年 月 日 時 分 秒, 可以改
    func getDateComponentsFrom(date: Date, dateComponents: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second]) -> DateComponents {
           
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = timeZone
           
        return calendar.dateComponents(dateComponents, from: date)
    }
    
    func getString(from date: Date, format: String = "yyyy-MM-dd") -> String {
        
        let dateFormatter = DateUtility.dateFormatter
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    func getDateFromString(string: String, format: String = "yyyy-MM-dd") -> Date? {
        
        let dateFormatter = DateUtility.dateFormatter
        dateFormatter.dateFormat = format
        dateFormatter.calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        
        if let date = dateFormatter.date(from: string) {
            return date
        }
        
        return nil
    }
    
    /// 拿取 weekday String
    /// - Parameter date: 目標 date
    func getWeekDayString(date: Date) -> String {
        
        let components = getDateComponentsFrom(date: date, dateComponents: [.weekday])
        
        if let index = components.weekday,
            let weekday = kWeekDays[index] {
            return weekday
        }
        return ""
    }
    
    func getDateByAdding(byAdding component: Calendar.Component, value: Int, to date: Date = Date()) -> Date? {
        
        return Calendar.current.date(byAdding: component, value: value, to: date)
    }
    
    func getDiff(in components: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second], from: Date, to: Date) -> DateComponents {
        
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        
        let componentsSet = Set(components)
        
        return calendar.dateComponents(componentsSet, from: from, to: to)
    }
    
    func isDateInToday(_ time: TimeInterval) -> Bool {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        return calendar.isDateInToday(Date(timeIntervalSince1970: time))
    }
    
    func isSameDay(_ date1: Date, inSameDayAs date2: Date) -> Bool {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}
