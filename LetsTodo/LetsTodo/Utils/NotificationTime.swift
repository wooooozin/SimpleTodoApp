//
//  NotificationTime.swift
//  LetsTodo
//
//  Created by 효우 on 2022/11/08.
//

import UIKit

enum NotificationTime: CaseIterable {
    case onTime
    case tenMinutesAgo
    case twelveMinutesAgo
    case thirtyMinutesAgo
    case fortyMinutesAgo
    case fiftyMinutesAgo
    case oneHourAgo
}

extension NotificationTime {
    var notiString: String {
        switch self {
        case .onTime:
            return "On the dot"
        case .tenMinutesAgo:
            return "10 min ago"
        case .twelveMinutesAgo:
            return "20 min ago"
        case .thirtyMinutesAgo:
            return "30 min ago"
        case .fortyMinutesAgo:
            return "40 min ago"
        case .fiftyMinutesAgo:
            return "50 min ago"
        case .oneHourAgo:
            return "60 min ago"
        }
    }
}
