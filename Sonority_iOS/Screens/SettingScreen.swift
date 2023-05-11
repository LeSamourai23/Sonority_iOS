//
//  SettingScreen.swift
//  Sonority
//
//  Created by Ayaan on 11/05/23.
//

import SwiftUI

struct SettingScreen: View {
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    @EnvironmentObject var viewModel: AuthViewModel
    //let padding = -20 * UIScreen.main.scale
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView{
            ZStack{
                
                bgColor
                
                GeometryReader{ geometry in
                    VStack(alignment: .leading, spacing: 40){
                        HStack{
                            Button {
                                //login
                            } label: {
                                Text("Theme")
                                //.padding(.leading, padding)
                                    .font(.system(size: 25))
                                    .foregroundColor(.white.opacity(0.7))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                        HStack{
                            Button {
                                //login
                            } label: {
                                Text("Delete Account")
                                //.padding(.leading, padding)
                                    .font(.system(size: 25))
                                    .foregroundColor(.white.opacity(0.7))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                        HStack{
                            Button {
                                viewModel.signOut()
                            } label: {
                                Text("Sign Out")
                                //.padding(.leading, padding)
                                    .font(.system(size: 25))
                                    .foregroundColor(.white.opacity(0.7))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                        /*HStack{
                            NavigationLink(destination: GetStarted()) {
                                Text("Log Out")
                                //.padding(.leading, padding)
                                    .font(.system(size: 25))
                                    .foregroundColor(.white.opacity(0.7))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }*/
                    }
                    .padding(.leading, geometry.safeAreaInsets.leading)
                    .padding(.trailing, 20)
                    .padding(.top, 130)
                }
                .padding(20)
            }
            .ignoresSafeArea()
        }
        .navigationBarTitle("Settings", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                    HStack {
                        Spacer()
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white.opacity(0.8))
                                .imageScale(.large)
                        }
                        Text("Settings")
                            .font(.system(size: 32))
                            .foregroundColor(.white.opacity(0.8))
                    }
                )
        }
}

struct SettingScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingScreen()
    }
}

