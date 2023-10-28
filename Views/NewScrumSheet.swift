//
//  ScrumSheet.swift
//  Scrumdinger
//
//  Created by 홍세희 on 2023/10/29.
//
//a view hierarchy directly in a sheet modifier.
import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum] //dailyScrum 배열 바인딩 추가 & 프리뷰 업데이트
    @Binding var isPrsentingNewScrumView: Bool
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPrsentingNewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum)
                            isPrsentingNewScrumView = false
                        }
                    }
                }
        }
    }
}

#Preview {
   NewScrumSheet(scrums: .constant(DailyScrum.sampleData), isPrsentingNewScrumView: .constant(true))
}
