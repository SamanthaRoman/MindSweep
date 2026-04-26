//
//  CompletedThoughtsView.swift
//  MindSweep
//
//  Created by Samantha Roman on 4/25/26.
//

import SwiftUI

struct CompletedThoughtsView: View {
    @EnvironmentObject var store: ThoughtStore

    var body: some View {
        VStack(spacing: 20) {
            Text("What you've completed")
                .font(.system(size: 22, weight: .regular))
                .foregroundStyle(MindSweepDesign.primaryText)

            VStack(spacing: 10) {
                ForEach(store.completedThoughts()) { thought in
                    HStack(spacing: 10) {
                        Image(systemName: "checkmark")
                            .foregroundStyle(MindSweepDesign.mainPink.opacity(0.75))

                        Text(thought.title)
                            .font(.system(size: 15))
                            .foregroundStyle(MindSweepDesign.primaryText.opacity(0.45))

                        Spacer()
                    }
                    .padding(14)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white.opacity(0.8))
                    )
                }
            }

            Text("You've completed \(store.completedThoughts().count) thoughts.")
                .font(.system(size: 13))
                .foregroundStyle(MindSweepDesign.secondaryText)
                .padding(.top, 10)

            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 32)
        .background(MindSweepDesign.background)
    }
}

















