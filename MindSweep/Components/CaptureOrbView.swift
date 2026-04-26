//
//  CaptureOrbView.swift
//  MindSweep
//
//  Created by Samantha Roman on 4/25/26.
//

import SwiftUI

enum CaptureState {
    case idle
    case listening
    case processing
    case released
}

struct CaptureOrbView: View {
    let state: CaptureState

    var body: some View {

        ZStack {
            if state == .idle {
                idleOrb
            } else if state == .released {
                releasedOrb
            } else {
                activeOrb
            }
        }
        .animation(.easeInOut(duration: 0.35), value: state)
    }

    private var idleOrb: some View {
        Circle()
            .fill(Color.white)
            .frame(width: 190, height: 190)
            .shadow(color: .black.opacity(0.08), radius: 24, x: 0, y: 12)
            .overlay(Image(systemName: "mic")
                .font(.system(size: 34))
                .foregroundStyle(MindSweepDesign.secondaryText)
            )
    }

    private var activeOrb: some View {
        ZStack {
            Circle()
                .fill(MindSweepDesign.softPink.opacity(0.22))
                .frame(width: 215, height: 215)
                .blur(radius: 10)

            Circle()
                .fill(Color.white.opacity(0.9))
                .frame(width: 170, height: 170)
                .offset(x: -28)

            Circle()
                .fill(MindSweepDesign.mainPink.opacity(0.35))
                .frame(width: 150, height: 150)
                .offset(x: 18)

            Circle()
                .fill(Color.white.opacity(0.65))
                .frame(width: 120, height: 120)
                .offset(y: 20)
        }
        .frame(width: 230, height: 230)
        .shadow(color: .black.opacity(0.08), radius: 22, x: 0, y: 12)
    }

    private var releasedOrb: some View {
        Circle()
            .fill(MindSweepDesign.softPink.opacity(0.18))
            .frame(width: 96, height: 96)
            .blur(radius: 2)
            .overlay(
                Image(systemName: "checkmark")
                    .font(.system(size: 26, weight: .medium))
                    .foregroundStyle(MindSweepDesign.primaryText.opacity(0.65))
            )
    }
}
