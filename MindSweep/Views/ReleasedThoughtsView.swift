//
//  ReleasedThoughtsView.swift
//  MindSweep
//
//  Created by Samantha Roman on 4/25/26.
//

import SwiftUI

struct ReleasedThoughtsView: View {
    @EnvironmentObject var store: ThoughtStore

    var body: some View {
        VStack(spacing: 20) {
            Text("What you've released")
                .font(.system(size: 22, weight: .regular))
                .foregroundStyle(MindSweepDesign.primaryText)

            VStack(spacing: 10) {
                ForEach(store.releasedThoughts()) { thought in
                    Text(thought.title)
                        .font(.system(size: 15))
                        .foregroundStyle(MindSweepDesign.secondaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(14)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.white.opacity(0.75))
                        )
                }
            }

            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 32)
        .background(MindSweepDesign.background)
    }
}


















