//
//  Circle.swift
//  FinanceSave
//
//  Created by yusuf on 18.12.2023.
//

import SwiftUI

struct CircleProgress: View {
    let progress: Double
    let total: Double

    var body: some View {
        ZStack {
            Text("Biriktilen Tutar: \(total, specifier: "%.1f")")
                .frame(width: Const.width * 0.5, alignment: .center)
                .padding()
                .overlay(
                    Circle()
                        .stroke(
                            Color.red.opacity(0.3), lineWidth: 20
                        )
                        .frame(width: Const.width * 0.7, height: Const.height * 0.35)
                )
            // 2
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.green,
                    style: StrokeStyle(
                        lineWidth: 20,
                        lineCap: .round,
                        lineJoin: .miter
                    )
                ).frame(width: Const.width * 0.7, height: Const.height * 0.35)
                .rotationEffect(.degrees(-90))
                .animation(.spring, value: progress)
        }
    }
}

#Preview {
    CircleProgress(progress: 40, total: 65)
}
