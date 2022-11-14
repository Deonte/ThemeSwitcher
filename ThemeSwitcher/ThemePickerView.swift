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
        Theme(type: .plain, color: .red),
        Theme(type: .plain, color: .green),
        Theme(type: .plain, color: .blue)
    ]
    
    let gradientThemes = [
        Theme(type: .gradient, colors: [.green, .yellow]),
        Theme(type: .gradient, colors: [.orange, .blue]),
        Theme(type: .gradient, colors: [.cyan, .blue])
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
                        theme.color
                            .frame(
                                width: self.selectedTheme == theme ? 100 : 50,
                                height: self.selectedTheme == theme ? 100 : 50
                            )
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
                            LinearGradient(colors: colors, startPoint: .top, endPoint:.bottom)
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
