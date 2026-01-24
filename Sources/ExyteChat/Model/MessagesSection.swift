//
//  Created by Alex.M on 08.07.2022.
//

import Foundation

struct MessagesSection: Equatable, @unchecked Sendable {

    let date: Date
    var rows: [MessageRow]

    init(date: Date, rows: [MessageRow]) {
        self.date = date
        self.rows = rows
    }

    var formattedDate: String {
        let calendar = Calendar.current
        
        if calendar.isDateInToday(date) {
            return "Today - \(timeString)"
        } else if calendar.isDateInYesterday(date) {
            return "Yesterday - \(timeString)"
        } else {
            // Check if within the last 6 days (rolling week)
            // Note: "Last week" usually implies distinct logic, but the request showed "Monday" without date for recent days.
            // Let's assume within last 6 days = Day Name only.
            let now = Date()
            if let daysAgo = calendar.dateComponents([.day], from: date, to: now).day, daysAgo < 7 {
                return "\(dayName) - \(timeString)"
            } else {
                // Check if this year
                let currentYear = calendar.component(.year, from: now)
                let dateYear = calendar.component(.year, from: date)
                
                if currentYear == dateYear {
                    // This year: Wed, Jan 14 - 5:05 PM
                    return "\(shortDateThisYear) - \(timeString)"
                } else {
                    // Prior years: Tue, Dec 23, 2025 - 7:51 AM
                    return "\(shortDatePriorYear) - \(timeString)"
                }
            }
        }
    }
    
    // Helpers
    private var timeString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: date)
    }
    
    private var dayName: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
    
    private var shortDateThisYear: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d"
        return formatter.string(from: date)
    }
    
    private var shortDatePriorYear: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d, yyyy"
        return formatter.string(from: date)
    }

    static func == (lhs: MessagesSection, rhs: MessagesSection) -> Bool {
        lhs.date == rhs.date && lhs.rows == rhs.rows
    }
}
