//
//  Create.swift
//  Memo
//
//  Created by Logan Makris on 11/18/24.
//

import SwiftUI

struct CreateView: View {
    @Binding var note: String
    @State private var openMemo: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Memo ✏️")
                    .font(.system(size: 40))
                
                TextField("Begin with a topic...", text: $note)
                    .padding()
                    .font(.system(size: 15))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 30)
                    .frame(width: 300)
                    .onSubmit {
                        createNote()
                    }
                
                Spacer()
                Link("Support on **GitHub**", destination: URL(string: "https://github.com/mr-suno/Memo")!)
                    .font(.system(size: 15))
                
                Text("Press **return** to create the note")
                    .frame(height: 50)
                    .font(.system(size: 15))
            }
            .navigationDestination(isPresented: $openMemo) {
                CreateMemo(note: $note)
            }
        }
    }
    
    func createNote() {
        openMemo = true
        
        note = ""
    }
}

struct CreateMemo: View {
    @Binding var note: String
    
    var body: some View {
        VStack {
            Text(note)
                .font(.title)
                .padding()
            
            TextField("Begin with a topic, presented by Memo 💭", text: $note)
                .padding()
                .font(.system(size: 15))
            
            Spacer()
        }
        .navigationTitle("Return to home")
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView(note: .constant(""))
    }
}
