//
//  LaneView.swift
//  MindSweep
//
//  Created by Samantha Roman on 4/25/26.
//

import SwiftUI

struct LaneView: View {
    let title: String
    let subtitle: String
    let thoughts: [Thought]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(MindSweepDesign.primaryText)

                Text(subtitle)
                    .font(.system(size: 13))
                    .foregroundStyle(MindSweepDesign.secondaryText)
            }

            VStack(spacing: 10) {
                ForEach(thoughts) { thought in
                    ThoughtCardView(thought: thought)
                }
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(MindSweepDesign.card)
                .shadow(color: .black.opacity(0.04), radius: 12, x: 0, y: 6)
        )
    }
}
