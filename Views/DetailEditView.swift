//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by 홍세희 on 2023/10/22.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum //내가 편집한 스크럼 나타나는 부분
    @State private var newAttendeeName = ""
    var body: some View {
        Form {
            Section(header: Text("Meeting info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Lnegth")
                    }
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $scrum.theme)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in //onDelete
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    })
                    .disabled(newAttendeeName.isEmpty) //텍필에 아무것도 안적혀있으면 버튼 비활성화 표시.
                }
            }
        }
    }
}

#Preview {
    DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
}
