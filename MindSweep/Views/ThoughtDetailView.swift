//
//  ThoughtDetailView.swift
//  MindSweep
//
//  Created by Samantha Roman on 4/25/26.
//

import SwiftUI

struct ThoughtDetailView: View {
    let thought: Thought
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 24) {
            topBar

            VStack(alignment: .leading, spacing: 16) {
                Text(thought.title)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(MindSweepDesign.primaryText)

                VStack(alignment: .leading, spacing: 6) {
                    Text(thought.dateText)
                    Text("Lane: \(laneName)")
                }
                .font(.system(size: 13))
                .foregroundStyle(MindSweepDesign.secondaryText)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Notes")
                        .font(.system(size: 13))
                        .foregroundStyle(MindSweepDesign.secondaryText)

                    Text("Add more details...")
                        .font(.system(size: 14))
                        .foregroundStyle(MindSweepDesign.primaryText.opacity(0.45))
                        .frame(maxWidth: .infinity, minHeight: 110, alignment: .topLeading)
                        .padding(14)
                        .background(RoundedRectangle(cornerRadius: 14)
                            .fill(Color.gray.opacity(0.08))
                        )
                }

                VStack(alignment: .leading, spacing: 14) {
                    detailRow(icon: "link", text: "Add Link")
                    detailRow(icon: "paperclip", text: "Add File")
                    detailRow(icon: "checklist", text: "Add Checklist")
                }
                .padding(.top, 4)

                HStack {
                    Spacer()

                    Button("Save") {
                        dismiss()
                    }
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(MindSweepDesign.primaryText.opacity(0.7))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(
                        Capsule()
                            .fill(Color.gray.opacity(0.12))
                    )

                    Button("Release") {
                        dismiss()
                    }
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(MindSweepDesign.primaryText.opacity(0.55))
                    .padding(.horizontal, 18)
                    .padding(.vertical, 12)
                }
                .padding(.top, 8)
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.white)
                    .shadow(color: .black.opacity(0.04), radius: 16, x: 0, y: 8)
            )

            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MindSweepDesign.background)
        .navigationBarBackButtonHidden(true)
    }

    private var topBar: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .font(.system(size:20))
                    .foregroundStyle(MindSweepDesign.primaryText.opacity(0.45))
            }

            Spacer()

            Text("Thought")
                .font(.system(size: 22, weight: .regular))
                .foregroundStyle(MindSweepDesign.primaryText)

            Spacer()

            Color.clear
                .frame(width: 24, height: 24)
        }
    }

    private var laneName: String {
        switch thought.lane {
        case .quick:
            return "Quick"
        case .focus:
            return "Focus"
        case .parked:
            return "Parking Lot"
        }
    }

    private func detailRow(icon: String, text: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 14))
                .foregroundStyle(MindSweepDesign.secondaryText)

            Text(text)
                .font(.system(size: 14))
                .foregroundStyle(MindSweepDesign.primaryText.opacity(0.75))
        }
    }
}

#Preview {
    ThoughtDetailView(
        thought: Thought(
            title: "Plan Mia's birthday ideas",
            dateText: "Added Apr 17",
            lane: .focus,
            status: .active,
        )
    )
}
































