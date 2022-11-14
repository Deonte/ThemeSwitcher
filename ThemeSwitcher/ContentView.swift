//
//  ContentView.swift
//  ThemeSwitcher
//
//  Created by Deonte Kilgore on 11/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingThemePicker: Bool = false
    @State var theme: Theme = Theme(type: ThemeType.plain, color: ColorName.red)
    @AppStorage("selectedTheme") private var selectedTheme: Data = Data()
    
    var body: some View {
        ZStack {
            if theme.type == ThemeType.plain {
                if let color = theme.color  {
                   Color(color.rawValue)
                        .edgesIgnoringSafeArea(.all)
                }
                
            } else if theme.type == ThemeType.gradient {
                if let colors = theme.colors {
                    LinearGradient(
                        colors:
                            [Color(colors[0].rawValue), Color(colors[1].rawValue)],
                                       startPoint: .top,
                                       endPoint:.bottom)
                        .edgesIgnoringSafeArea(.all)
                }
            } else if theme.type == ThemeType.image {
                if let image = theme.image {
                    Image(image.rawValue)
                        .resizable()
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
        .onAppear {
            loadTheme()
        }
        .onChange(of: theme) { newValue in
            saveTheme()
        }
    }
    
    func loadTheme() {
        guard let theme = try? JSONDecoder().decode(Theme.self, from: selectedTheme) else { return }
        if theme.type == ThemeType.plain {
            self.theme = Theme(type: theme.type, color: theme.color)
        } else if theme.type == ThemeType.gradient {
            self.theme = Theme(type: theme.type, colors: theme.colors)
        } else if theme.type == ThemeType.image {
            self.theme = Theme(type: theme.type, image: theme.image)
        }
    }
    
    func saveTheme() {
        let theme = self.theme
        guard let selectedThemeData = try? JSONEncoder().encode(theme) else { return }
        self.selectedTheme = selectedThemeData
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
