//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by 홍세희 on 2023/10/24.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondRemaining: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondsElapsed + secondRemaining
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    //MARK: Step8
    private var minutesRemaining: Int {
        secondRemaining / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondRemaining)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("\(minutesRemaining)") //VoiceOver 사용자를 위한 처리
            .padding([.top, .horizontal])
//            .padding(.top)
//            .padding(.horizontal)
        }
    }
}
    
struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondRemaining: 180, theme: .bubblegum)
            .previewLayout(.sizeThatFits)
    }
}
