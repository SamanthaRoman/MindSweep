//
//  ArchiveView.swift
//  MindSweep
//
//  Created by Samantha Roman on 4/25/26.
//

import SwiftUI

struct ArchiveView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Archive")
                .font(.system(size: 22, weight: .regular))
                .foregroundStyle(MindSweepDesign.primaryText)

            VStack(spacing: 0) {
                NavigationLink(destination: CompletedThoughtsView()) {
                    archiveRow("Completed Thoughts")
                }

                Divider().opacity(0.35)

                NavigationLink(destination: ReleasedThoughtsView()) {
                    archiveRow("Released Thoughts")
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.white)
                    .shadow(color: .black.opacity(0.04), radius: 14, x: 0, y: 8)
            )

            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 32)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MindSweepDesign.background)
    }

    private func archiveRow(_ title: String) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 15))
                .foregroundStyle(MindSweepDesign.primaryText)

            Spacer ()

            Image(systemName: "chevron.right")
                .font(.system(size: 13))
                .foregroundStyle(MindSweepDesign.secondaryText)
        }
        .padding(18)
    }
}






















