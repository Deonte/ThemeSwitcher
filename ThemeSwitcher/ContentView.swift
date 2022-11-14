//
//  ContentView.swift
//  ThemeSwitcher
//
//  Created by Deonte Kilgore on 11/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingThemePicker: Bool = false
    @State var theme: Theme = Theme(type: .plain, color: ColorNames.red)
      
    var body: some View {
        ZStack {
            if theme.type == ThemeType.plain.rawValue {
                if let color = theme.color  {
                    Rectangle()
                        .foregroundColor(Color(color.rawValue))
                        .edgesIgnoringSafeArea(.all)
                }
               
            } else if theme.type == ThemeType.gradient.rawValue {
                if let colors = theme.colors {
                    LinearGradient(
                        colors:
                            [Color(colors[0].rawValue), Color(colors[1].rawValue)],
                                       startPoint: .top,
                                       endPoint:.bottom)
                        .edgesIgnoringSafeArea(.all)
                }
            }
            
            VStack {
                Button {
                    isShowingThemePicker = true
                } label: {
                    Text("Theme Picker")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(12)
                }
            }
        }
        .sheet(isPresented: $isShowingThemePicker) {
            ThemePickerView(selectedTheme: $theme)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
