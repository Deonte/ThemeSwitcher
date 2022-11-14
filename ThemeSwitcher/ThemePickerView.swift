//
//  ThemePickerView.swift
//  ThemeSwitcher
//
//  Created by Deonte Kilgore on 11/12/22.
//

import SwiftUI

struct ThemePickerView: View {
    @Binding var selectedTheme: Theme
    
    let plainThemes = [
        Theme(type: .plain, color: ColorNames.red),
        Theme(type: .plain, color: ColorNames.green),
        Theme(type: .plain, color: ColorNames.blue)
    ]
    
    let gradientThemes = [
        Theme(type: .gradient, colors: [ColorNames.red, ColorNames.yellow]),
        Theme(type: .gradient, colors: [ColorNames.orange, ColorNames.blue]),
        Theme(type: .gradient, colors: [ColorNames.cyan, ColorNames.blue])
    ]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Plain")
            HStack {
                ForEach(plainThemes, id: \.color) { theme in
                    Button {
                        selectedTheme = theme
                        dismiss()
                    } label: {
                        if let color = theme.color?.rawValue {
                            Color(color)
                                .frame(
                                    width: self.selectedTheme == theme ? 100 : 50,
                                    height: self.selectedTheme == theme ? 100 : 50
                                )
                        }
                    }
                }
            }
            
            Text("Gradients")
            HStack {
                ForEach(gradientThemes, id: \.colors) { theme in
                    if let colors = theme.colors {
                        Button {
                            selectedTheme = theme
                            dismiss()
                        } label: {
                            LinearGradient(
                                colors: [Color(colors[0].rawValue), Color(colors[1].rawValue)],
                                startPoint: .top,
                                endPoint:.bottom
                            )
                            .frame(
                                width: self.selectedTheme == theme ? 100 : 50,
                                height: self.selectedTheme == theme ? 100 : 50
                            )
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct ThemePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ThemePickerView(selectedTheme: .constant(Theme(type: .plain, color: .red)))
    }
}