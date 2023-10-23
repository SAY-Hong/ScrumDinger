//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by 홍세희 on 2023/10/22.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme //MARK: Binding
    var body: some View {
        //MARK: Picker
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    //MARK: .constant
    //to create a binding to a hard-coded, immutable value.
    ThemePicker(selection: .constant(.lavender))
}
