//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by 홍세희 on 2023/10/16.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { return Self() }
}


