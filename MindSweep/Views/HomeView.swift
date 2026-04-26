//
//  HomeView.swift
//  MindSweep
//
//  Created by Samantha Roman on 4/25/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: ThoughtStore
    @State private var captureState: CaptureState = .idle

    var titleText: String {
        switch captureState {
        case .idle:
            return "Say it. Let it go."
        case .listening:
            return "What's on your mind?"
        case .processing:
            return "Processing..."
        case .released:
            return "Thought safely stored"
        }
    }

    var subtitleText: String {
        switch captureState {
        case .idle:
            return "Tap and speak"
        case .listening:
            return "I'm listening."
        case .processing:
            return ""
        case .released:
            return "Handled."
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 22) {
                topBar

                Spacer()

                Text("MindSweep")
                    .font(.system(size: 28, weight: .regular))
                    .foregroundStyle(MindSweepDesign.primaryText.opacity(0.8))

                VStack(spacing: 8) {
                    Text(titleText)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundStyle(MindSweepDesign.primaryText)

                    if !subtitleText.isEmpty {
                        Text(subtitleText)
                            .font(.system(size: 20, weight: .regular))
                            .foregroundStyle(MindSweepDesign.secondaryText)
                    }
                }
                .frame(height: 64)

                Button {
                    runCaptureFlow()
                } label: {
                    CaptureOrbView(state: captureState)
                }
                .buttonStyle(.plain)
                .padding(.top, 16)

                Spacer()

                Text("3 loops cleared today")
                    .font(.system(size: 13))
                    .foregroundStyle(MindSweepDesign.secondaryText)
                    .padding(.bottom, 26)
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(MindSweepDesign.background)
        }
    }

    private var topBar: some View {
        HStack {
            NavigationLink(destination: OrganizedView()) {
                Image(systemName: "square.grid.2x2")
                    .font(.system(size: 18))
                    .foregroundStyle(MindSweepDesign.primaryText.opacity(0.6))
            }

            Spacer()

            NavigationLink(destination: ArchiveView()) {
                Image(systemName: "clock.arrow.circlepath")
                    .font(.system(size: 18))
                    .foregroundStyle(MindSweepDesign.primaryText.opacity(0.6))
            }
        }
        .padding(.top, 8)
    }

    private func runCaptureFlow() {
        guard captureState == .idle else { return }

        captureState = .listening

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            captureState = .processing
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
            captureState = .released
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
            captureState = .idle
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(ThoughtStore())
}
