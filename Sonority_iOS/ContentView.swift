//
//  ContentView.swift
//  Sonority_iOS
//
//  Created by Ayaan on 11/05/23.
//

import SwiftUI

let HexCode = "000000"
let HexCode2 = "252A34"
let HexCode3 = "4a5cff"
let HexCode4 = "7c4dff"
let HexCode6 = "ffffff"
let bgColor = Color(hex: HexCode)
let inpColor = Color(hex: HexCode2)
let butColor = Color(hex: HexCode3)
let lgColor = Color(hex: HexCode4)
let whiteColor = Color(hex: HexCode6)

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject private var albumNetworkModel: AlbumNetworkModel
    
    var body: some View{
        Group{
            if viewModel.userSession != nil {
                Homescreen()
            }
            else{
                LoginScreen()
            }
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        
        if scanner.scanHexInt64(&rgbValue) {
            let r = Double((rgbValue & 0xff0000) >> 16 ) / 255.0
            let g = Double((rgbValue & 0x00ff00) >> 8 ) / 255.0
            let b = Double(rgbValue & 0x0000ff) / 255.0
            
            self.init(red: r, green: g, blue: b)
            return
        }
        
        self.init(red: 1, green: 1, blue: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
