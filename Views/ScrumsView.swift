//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by 홍세희 on 2023/10/17.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        //네비게이션 계층 만들기
        NavigationStack {
            List($scrums) { $scrum in //title프로퍼티 -> 각 아이템을 구별하는 고유 id로 쓰기.
                NavigationLink(destination: DetailView(scrum: $scrum)) { //TODO: Create the detail view - step5
                    CardView(scrum: scrum) //카드뷰 초기화하가
                }
                .listRowBackground(scrum.theme.mainColor) //listRowBackground로 고유 색깔 지정해주기.
            }
            .navigationTitle("Daily Scrum")
            .toolbar {
                Button(action: {}, label: { //TODO: 버튼 기능 구현하기
                    Image(systemName: "plus")
                })
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData)) //scrum의 array와 ScrumsView를 초기화하기 -> 안하면 오류난다.
}
