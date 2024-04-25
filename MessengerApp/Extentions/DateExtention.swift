//
//  DateExtention.swift
//  MessengerApp
//
//  Created by Gentjan Manuka on 2024-04-15.
//

import Foundation

enum DateType : String {
    case hour = "HH:mm" // return 19:00
    case date = "EEEE d MMMM" //return Fredag 12 mars
    case chatDate = "dd/mm/yy HH:mm"
    case dateAndHour = "EEEE d MMMM HH:mm"
    case fullDate = "EEEE d MMMM yyyy" //return full date
    case day = "dd"
    case weekday = "EEE"
    case month = "MMM"
    case dateJSON = "yyyy-MM-dd'T'HH:mm:ssZ"
}

extension Date {
    func extractDate(to dateType: DateType) -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateType.rawValue
        return dateFormatter.string(from: self)
    }
    
    func showTime() -> String{
        if Calendar.current.isDateInToday(self){
            return self.extractDate(to: .hour)
        } else if Calendar.current.isDateInYesterday(self) {
            return "Yesterday " + self.extractDate(to: .hour)
        } else {
            return self.extractDate(to: .chatDate)
        }
    }
}
