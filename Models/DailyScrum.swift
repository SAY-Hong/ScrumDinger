//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by 홍세희 on 2023/10/16.
//

import Foundation

struct DailyScrum: Identifiable {
    var id: UUID //객체가 고유하고 같지 않음을 보장해주는 역할! -> 랜덤하게 긴 문자열을 만들어준다.. 생각하기
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthMinutesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    var theme: Theme
    
    //MARK: ?
    //13번줄이랑 19번줄 attendees 타입 다른데 오류가..? 안뜨는데
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

//MARK: Iterate through attendees. -> 텍스트뷰가 각각 구성되게 배치?
extension DailyScrum {
    struct Attendee: Identifiable { //Identifiable가 필요햔 id property 추가하기. -> 안하면 오류터짐
        let id: UUID //id property  추가하기
        var name: String
        
        //MARK: ?
        //init으로 자동 초기화 했을 때는 UUID로만 되는데 왜 UUID = UUID()로 따로 써야하지
        //구조체 초기화 할때는 그냥 저렇게 써야되나
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
}

extension DailyScrum {
    static var sampleData: [DailyScrum] {
        [
            DailyScrum(title: "Design", attendees: ["Cathy", "Dasiy", "Simon", "John"], lengthInMinutes: 10, theme: .yellow),
            DailyScrum(title: "App Dev", attendees: ["Katis", "Gray", "Luis", "Darla", "Euna"], lengthInMinutes: 5, theme: .orange),
            DailyScrum(title: "Web Dev", attendees: ["Chella", "Chirs", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Ched", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
            
        ]
    }
}


