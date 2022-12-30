//
//  Profile.swift
//  Landmarks
//
//  Created by Don McKenzie on 12/29/22.
//

import Foundation

struct Profile {
    var username: String
    var preferNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌹" // Flower icon
        case summer = "☀️" // Sun icon
        case autumn = "🍂" // Leaves icon
        case winter = "❄️" // Ice and snow icon (snowman)
        
        var id: String { rawValue }
    }
    
}
