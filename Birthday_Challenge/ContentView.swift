//
//  ContentView.swift
//  Birthday_Challenge
//
//  Created by Trytten, Blake - Student on 9/19/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name: String = ""
    @State private var selectedDate: Date = Date()
    @State private var custom: Color = .blue
    @State private var mode = false
    @State private var fontSize = 20.0
    @State private var pressed: Bool = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(BackgroundMode())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(edges: .all)

            VStack {
                Toggle("Dark mode? \(mode ? "(Off)" : "(On)")",isOn: $mode)
                
                Text("Text Size:")
                    .font(.title2)
                Slider(value: $fontSize, in: 10...35) {
                    //accessabilty
                }minimumValueLabel: {
                    Image(systemName: "minus")
                }maximumValueLabel: {
                    Image(systemName: "plus")
                }
                Spacer(minLength: 20)
                VStack {
                    TextField("Who's Birthday is is?:",text: $name)
                    DatePicker("Whats the date today?:",selection: $selectedDate)
                }
                .padding()
                .background()
                    
                
                Spacer()
                
                ColorPicker("Pick A font Color:", selection: $custom)
                
                Spacer()
                
                HStack {
                    Button("Press Me") {
                         pressed.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(.yellow)
                    .fontWeight(.black)
                    
                    Text("Your Date: \(selectedDate.formatted())"
                    )
                    Text("Happy Birthday \(name)!")
                        .opacity(pressed ? 1 : 0)
                    
                }
                .font(.system(size: fontSize))
                .foregroundColor(custom)
                
                
                
            }
            .padding(20)
            .foregroundColor(DarkMode())
            .datePickerStyle(.graphical)
        }
    }
    func DarkMode() -> Color {
        if mode == true {
            return .black
        }
        else {
            return .white
        }
    }
    func BackgroundMode() -> Color {
        if mode == true {
            return .white
        }
        else {
            return .black
        }
    }

}



#Preview {
    ContentView()
}
