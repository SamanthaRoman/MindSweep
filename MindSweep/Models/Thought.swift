//
//  Thought.swift
//  MindSweep
//
//  Created by Samantha Roman on 4/25/26.
//

import Foundation

//enum ThoughtLane: String, CaseIterable,Identifiable {
//    case quick = "Quick"
//    case focus = "Focus"
//    case parked = "Parking Lot"
//
//    var id: String { rawValue }
//
//    var subtitle: String {
//        switch self {
//        case .quick:
//            return "Fast things you can clear quickly"
//        case .focus:
//            return "Things that need your attention"
//        case .parked:
//            return "Safe to keep for later"
//        }
//    }
//}
//
//enum ThoughtStatus {
//    case active
//    case completed
//    case released
//}

struct Thought: Identifiable {
    let id = UUID()
    
    var title: String
    var dateText: String
    var lane: ThoughtLane
    var status: ThoughtStatus
    var notes: String = ""
    var isStarred: Bool = false 
}

enum ThoughtLane {
    case quick
    case focus
    case parked
}

enum ThoughtStatus {
    case active
    case completed
    case released
}
