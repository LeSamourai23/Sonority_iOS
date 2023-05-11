//
//  InputView.swift
//  Sonority
//
//  Created by Ayaan on 11/05/23.
//

import SwiftUI

struct InputView: View {
    
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack {
            if isSecureField{
                let placeholderAttrs: [NSAttributedString.Key: Any] = [                    .foregroundColor: whiteColor            ]
                let attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderAttrs)
                SecureField("", text: $text, onCommit: {})
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundColor(inpColor.opacity(0.8)))
                    .padding(.horizontal)
                    .frame(height: 100)
                    .overlay(
                        // Overlay the custom placeholder text
                        Text(attributedPlaceholder.string)
                            .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                            .font(.system(size: 16))
                            .padding(.leading, -160)
                            .opacity(text.isEmpty ? 1 : 0)
                    )

            } else {
                let placeholderAttrs: [NSAttributedString.Key: Any] = [                    .foregroundColor: whiteColor            ]
                let attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderAttrs)
                TextField("", text: $text, onEditingChanged: { _ in }, onCommit: {})
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundColor(inpColor.opacity(0.8)))
                    .padding(.horizontal)
                    .frame(height: 100)
                    .overlay(
                        // Overlay the custom placeholder text
                        Text(attributedPlaceholder.string)
                            .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                            .font(.system(size: 16))
                            .padding(.leading, -160)
                            .opacity(text.isEmpty ? 1 : 0)
                    )
                }
                
            }
        .padding(.bottom, -20)
    }
    
    struct InputView_Previews: PreviewProvider {
        static var previews: some View {
            InputView(text: .constant(""), title: "Email Address", placeholder: "Email")
        }
    }
}
