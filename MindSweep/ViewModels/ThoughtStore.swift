//
//  ThoughtStore.swift
//  MindSweep
//
//  Created by Samantha Roman on 4/25/26.
//

import Foundation
import Combine 

final class ThoughtStore: ObservableObject {
    @Published var thoughts: [Thought] = [
        Thought(title: "Call vet about appointment", dateText: "Added Apr 17", lane: .quick, status: .active),
        Thought(title: "Text Sirina about schedule", dateText: "Added Apr 17", lane: .quick, status: .active),

        Thought(title: "Plan Mia's birthday party", dateText: "Added Apr 17", lane: .focus, status: .active),
        Thought(title: "Outline YouTube series ideaws", dateText: "Added Apr 17", lane: .focus, status: .active),

        Thought(title: "Research retreat ideas for moms", dateText: "Added Apr 17", lane: .parked, status: .active),
        Thought(title: "Look into family summer trips", dateText: "Added Apr 17", lane: .parked, status: .active),

        Thought(title: "Schedule dog training program", dateText: "Completed Apr 18", lane: .focus, status: .completed),
        Thought(title: "Order Mia's costume", dateText: "Completed Apr 18", lane: .quick, status: .completed),

        Thought(title: "Compare multiple business ideas", dateText: "Released Apr 17", lane: .parked, status: .released),
        Thought(title: "Plan perfect morning routine", dateText: "Released Apr 17", lane: .focus, status: .released)
    ]

    func activeThoughts(for lane: ThoughtLane) -> [Thought] {
        thoughts.filter { $0.lane == lane && $0.status == .active }
    }

    func completedThoughts() -> [Thought] {
        thoughts.filter { $0.status == .completed }
    }

    func releasedThoughts() -> [Thought] {
        thoughts.filter { $0.status == .released }
    }

    func release(_ thought: Thought) {
        guard let index = thoughts.firstIndex(where: { $0.id == thought.id }) else { return }
        thoughts[index].status = .released
        thoughts[index].dateText = "Released Apr 18"
    }

    func complete(_ thought: Thought) {
        guard let index = thoughts.firstIndex(where: { $0.id == thought.id }) else { return }
        thoughts[index].status = .completed
        thoughts[index].dateText = "Completed Apr 18"
    }
}

