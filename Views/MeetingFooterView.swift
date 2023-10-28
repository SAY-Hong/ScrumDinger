//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by 홍세희 on 2023/10/25.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void
    
    //MARK: [스피커 숫자 결정하기] Extract meeting fooer 6 - 4
    //ScrumTimer -> 시간이 끝날 때 각 스피커 알아서 표시해줌.
    //첫번째 스피커 -> 활성화된 스피커가 되기 전에는 표시X
    //speakerNumber property -> 인덱스: '활성화된 스피커 숫자'
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: {!$0.isCompleted}) else { return nil }
        return index + 1
    }
    
    //MARK: [활성화된 스피커가 마지막인지 확인] Extract meeting fooer 6 - 5
    //allSatisfy() 메소드: 콜렉션의 모든 원소가 특정조건을 만족시키는지 확인.
    private var isLastSpeaker: Bool {
        //return speakers.dropLast().allSatisfy { $0.isCompleted }
        return speakers.dropLast().reduce(true) { $0 && $1.isCompleted} //위의 주석처리된 줄이랑 같은 표현
    }
    
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers"}
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

#Preview {
    MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {}) //using the speakers property -> DailyScrum.attendees.
        .previewLayout(.sizeThatFits)
}
