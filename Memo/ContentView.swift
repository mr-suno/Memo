//
//  MemoApp.swift
//  Memo
//
//  Created by Logan Makris on 11/17/24.
//

import SwiftUI

struct ContentView: View {
    let options = ["Create ‎ ✏️", "Saved ‎ 🗒️", "Settings ‎ 🛠️"]
    
    @State private var selection: String = "Create ‎ ✏️"
    @State private var note: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Pages", selection: $selection) {
                    ForEach(options, id: \.self) { option in
                        Text(option)
                    }
                }
                .pickerStyle(.segmented)
                .padding()

                Group {
                    if selection == "Create ‎ ✏️" {
                        CreateView(note: $note)
                    } else if selection == "Saved ‎ 🗒️" {
                        SavedView()
                    } else if selection == "Settings ‎ 🛠️" {
                        SettingsView()
                    }
                }
            }
            .navigationTitle("New Memo")
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
