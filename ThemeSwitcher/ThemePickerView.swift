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
        Theme(type: .plain, color: ColorName.red),
        Theme(type: .plain, color: ColorName.green),
        Theme(type: .plain, color: ColorName.blue),
        Theme(type: .plain, color: ColorName.pink),

    ]
    
    let gradientThemes = [
        Theme(type: .gradient, colors: [ColorName.red, ColorName.yellow]),
        Theme(type: .gradient, colors: [ColorName.orange, ColorName.blue]),
        Theme(type: .gradient, colors: [ColorName.cyan, ColorName.blue])
    ]
    
    let imageThemes = [
        Theme(type: .image, image: ImageName.mountain),
        Theme(type: .image, image: ImageName.water),
        Theme(type: .image, image: ImageName.forest)
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
            
            Text("Images")
            HStack {
                ForEach(imageThemes, id: \.image) { theme in
                    if let image = theme.image {
                        Button {
                            selectedTheme = theme
                            dismiss()
                        } label: {
                            Image(image.rawValue)
                                .resizable()
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
