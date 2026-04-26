//
//  ThoughtCardView.swift
//  MindSweep
//
//  Created by Samantha Roman on 4/25/26.
//

import SwiftUI

struct ThoughtCardView: View {
    let thought: Thought
    @EnvironmentObject var store: ThoughtStore
    @State private var showCompleted = false

    var body: some View {
        HStack(spacing: 12) {
            Button {
                withAnimation(.easeInOut(duration: 0.25)) {
                    showCompleted = true
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    store.complete(thought)
                }
            } label: {
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1.5)
                        .frame(width: 18, height: 18)

                    if showCompleted {
                        Circle()
                            .fill(MindSweepDesign.softPink.opacity(0.35))
                            .frame(width: 28, height: 28)
                            .blur(radius: 6)

                        Image(systemName: "checkmark")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(MindSweepDesign.mainPink.opacity(0.765))
                    }
                }

            }
            .buttonStyle(.plain)

            NavigationLink(destination: ThoughtDetailView(thought: thought)) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(thought.title)
                        .font(.system(size: 15, weight: .medium))
                        .foregroundStyle(MindSweepDesign.primaryText)

                    Text(thought.dateText)
                        .font(.system(size: 12))
                        .foregroundStyle(MindSweepDesign.secondaryText)
                }
            }
            .buttonStyle(.plain)

            Spacer()

            Button {
                store.release(thought)
            } label: {
                Text("Release")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(MindSweepDesign.primaryText.opacity(0.55))
            }
            .buttonStyle(.plain)
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.04), radius: 12, x: 0, y: 6)
        )
    }
}

