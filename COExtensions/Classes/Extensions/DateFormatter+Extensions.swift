//
//  DateFormatter+Extensions.swift
//  Pods
//
//  Created by BIMSERMAC on 19.04.2019.
//

import Foundation
import UIKit

extension DateFormatter {
    /**
     Formats a date as the time since that date (e.g., “Last week, yesterday, etc.”).
     
     - Parameter from: The date to process.
     - Parameter numericDates: Determines if we should return a numeric variant, e.g. "1 month ago" vs. "Last month".
     
     - Returns: A string with formatted `date`.
     */
    
    func setCustomDateFormat(_ format:String,and timeZone:String? = nil){
        self.dateFormat = format
        if timeZone != nil{
            self.timeZone = NSTimeZone(abbreviation: timeZone!) as TimeZone?
        }
    }
    func setDefaultDateFormat(){
        self.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.timeZone = NSTimeZone(abbreviation: "GMT+0:00") as TimeZone?
    }
    func getDateFromString(dateString:String)->NSDate{
        return self.date(from: dateString)! as NSDate
    }
    func timeSince(from: NSDate, numericDates: Bool = false, language:String? = "TR") -> String {
        
        var yearsAgo = ""
        var yearAgo = ""
        var lastYear = ""
        var monthsAgo = ""
        var monthAgo = ""
        var lastMonth = ""
        var weekAgo = ""
        var weeksAgo = ""
        var lastWeek = ""
        var daysAgo = ""
        var dayAgo = ""
        var today = ""
        var hoursAgo = ""
        var hourAgo = ""
        var minuteAgo = ""
        var minutesAgo = ""
        var secondsAgo = ""
        var justNow = ""
        var yesterday = ""
        
        if language == "TR"{
            yearsAgo = "Yıl Önce"
            yearAgo = "Yıl Önce"
            lastYear = "Geçen Yıl"
            monthsAgo = "Ay Önce"
            monthAgo = "Ay Önce"
            lastMonth = "Geçen Ay"
            weekAgo = "Hafta Önce"
            weeksAgo = "Hafta Önce"
            lastWeek = "Geçen Hafta"
            daysAgo = "Gün Önce"
            dayAgo = "Gün Önce"
            today = "Bugün"
            hoursAgo = "Saat Önce"
            hourAgo = "Saat Önce"
            minuteAgo = "Dakika Önce"
            minutesAgo = "Dakika Önce"
            secondsAgo = "Saniye Önce"
            justNow = "Şimdi"
            yesterday = "Dün"
        }
        else{
            yearsAgo = "Years Ago"
            yearAgo = "Year Ago"
            lastYear = "Last Year"
            monthsAgo = "Months Ago"
            monthAgo = "Month Ago"
            lastMonth = "Last Month"
            weekAgo = "Week Ago"
            weeksAgo = "Weeks Ago"
            lastWeek = "Last Week"
            daysAgo = "Days Ago"
            dayAgo = "Day Ago"
            today = "Today"
            hoursAgo = "Hours Ago"
            hourAgo = "Hour Ago"
            minuteAgo = "Minute Ago"
            minutesAgo = "Minutes Ago"
            secondsAgo = "Seconds Ago"
            justNow = "Just Now"
            yesterday = "Yesterday"

        }
        
        
        let calendar = Calendar.current
        let now = NSDate()
        let earliest = now.earlierDate(from as Date)
        let latest = earliest == now as Date ? from : now
        let components = calendar.dateComponents([.year, .weekOfYear, .month, .day, .hour, .minute, .second], from: earliest, to: latest as Date)
        
        var result = ""
        
        if components.year! >= 2 {
            
            result = "\(components.year!) " + yearsAgo
        }
        else if components.year! >= 1 {
            if numericDates {
                result = "1 " + yearAgo
            } else {
                result = lastYear
            }
        }
        else if components.month! >= 2 {
            result = "\(components.month!) " + monthsAgo
        }
        else if components.month! >= 1 {
            if numericDates {
                result = "1 " + monthAgo
            }
            else {
                result = lastMonth
            }
        }
        else if components.weekOfYear! >= 2 {
            result = "\(components.weekOfYear!) " + weeksAgo
        }
        else if components.weekOfYear! >= 1 {
            if numericDates {
                result = "1 " + weekAgo
            }
            else {
                result = lastWeek
            }
        }
        else if components.day! >= 2 {
            result = "\(components.day!) " + daysAgo
        }
        else if components.day! >= 1 {
            if numericDates {
                result = "1 " + dayAgo
            }
            else {
                result = yesterday
            }
        }
        else if components.day! == 0 {
            result = today
        }
        else if components.hour! >= 2 {
            result = "\(components.hour!) " + hoursAgo
        }
        else if components.hour! >= 1 {
            if numericDates {
                result = "1 " + hourAgo
            }
            else {
                result = "An " + hourAgo
            }
        }
        else if components.minute! >= 2 {
            result = "\(components.minute!) " + minutesAgo
        }
        else if components.minute! >= 1 {
            if numericDates {
                result = "1 " + minuteAgo
            }
            else {
                result = "A " + minuteAgo
            }
        }
        else if components.second! >= 3 {
            result = "\(components.second!) " + secondsAgo
        }
        else {
            result = justNow
        }
        
        return result
    }
}

