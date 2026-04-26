//
//  OrganizedView.swift
//  MindSweep
//
//  Created by Samantha Roman on 4/25/26.
//

import SwiftUI

struct OrganizedView: View {
    @EnvironmentObject var store: ThoughtStore
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 22) {
            topBar

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    LaneView(
                        title: "Quick Tasks",
                        subtitle: "Fast things you can clear quickly",
                        thoughts: store.activeThoughts(for: .quick)
                    )

                    LaneView(
                        title: "Focus",
                        subtitle: "Things that need your attention",
                        thoughts: store.activeThoughts(for: .focus)
                    )

                    LaneView(
                        title: "Parking Lot",
                        subtitle: "Safe to keep for later",
                        thoughts: store.activeThoughts(for: .parked)
                    )
                }
                .padding(.horizontal, 24)
            }

            Spacer()

            Text("You cleared 3 loops today.")
                .font(.system(size: 13))
                .foregroundStyle(MindSweepDesign.secondaryText)
                .padding(.bottom, 20)
        }
        .padding(.top, 20)
        .background(MindSweepDesign.background)
        .padding(.bottom,20)
    }

    private var topBar: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .font(.system(size: 20))
                    .foregroundStyle(MindSweepDesign.primaryText.opacity(0.45))
            }

            Spacer()

            VStack(alignment: .leading, spacing: 4) {
                Text("Your Mind, Organized")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(MindSweepDesign.primaryText)

                Text("Clear. Focused. In control.")
                    .font(.system(size: 14))
                    .foregroundStyle(MindSweepDesign.secondaryText)
            }

            Spacer()

            Image(systemName: "gearshape")
                .font(.system(size: 18))
                .foregroundStyle(MindSweepDesign.primaryText.opacity(0.45))
        }
        .padding(.bottom, 24)
    }

}
