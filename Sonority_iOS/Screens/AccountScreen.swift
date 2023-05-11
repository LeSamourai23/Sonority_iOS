//
//  AccountScreen.swift
//  Sonority
//
//  Created by Ayaan on 11/05/23.
//

import SwiftUI

struct AccountScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    //let session = URLSession.shared
    //let limit = 20 // Number of album covers to fetch

    var body: some View {
        if let user = viewModel.currentUser{
            NavigationView{
                ZStack{
                    
                    bgColor
                    
                    VStack(spacing:15){
                        VStack(spacing: 5){
                            Image(systemName: "person.circle.fill")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 100))
                            
                            Text(user.fullname)
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 32))
                        }
                        .padding(.top, 150)
                        
                        VStack{
                            GeometryReader{ geometry in
                                VStack(alignment: .leading){
                                    
                                    VStack(alignment: .leading){
                                        HStack{
                                            Button {
                                            
                                            } label: {
                                                Text("Saved Albums")
                                                //.padding(.leading, padding)
                                                    .font(.system(size: 25))
                                                    .foregroundColor(.white.opacity(0.7))
                                                    .frame(alignment: .leading)
                                                
                                                Image(systemName: "chevron.right")
                                                    .font(.system(size: 25))
                                                    .foregroundColor(.white.opacity(0.7))
                                                    .padding(.leading, 10)
                                            }
                                        }
                                        
                                        ScrollView(.horizontal){
                                            
                                            HStack{
                                                Image("album-1")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 150, height: 150)
                                                    .cornerRadius(10)
                                                
                                                Image("album-2")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 150, height: 150)
                                                    .cornerRadius(10)
                                                
                                                Image("album-4")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 150, height: 150)
                                                    .cornerRadius(10)
                                            }
                                        }
                                        .padding(.bottom, 30)
                                    }
                                    
                                    VStack(alignment: .leading){
                                        HStack{
                                            Button {
                                            
                                            } label: {
                                                Text("Recent History")
                                                //.padding(.leading, padding)
                                                    .font(.system(size: 25))
                                                    .foregroundColor(.white.opacity(0.7))
                                                    .frame(alignment: .leading)
                                                
                                                Image(systemName: "chevron.right")
                                                    .font(.system(size: 25))
                                                    .foregroundColor(.white.opacity(0.7))
                                                    .padding(.leading, 10)
                                            }
                                        }
                                        
                                        ScrollView(.horizontal){
                                            
                                            HStack{
                                                Image("album-6")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 150, height: 150)
                                                    .cornerRadius(10)
                                                
                                                Image("album-8")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 150, height: 150)
                                                    .cornerRadius(10)
                                                
                                                Image("album-5")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 150, height: 150)
                                                    .cornerRadius(10)
                                                
                                                Image("album-9")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 150, height: 150)
                                                    .cornerRadius(10)
                                                
                                                Image("album-10")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 150, height: 150)
                                                    .cornerRadius(10)
                                            }
                                        }
                                        .padding(.bottom, 30)
                                    }
                                }
                                .padding(.leading, geometry.safeAreaInsets.leading)
                                .padding(.trailing, 20)
                                .padding(.top, 30)
                            }
                            .padding(.leading, 15)
                        }
                    }
                    
                }
                .ignoresSafeArea()
            }
            .navigationBarTitle("Account", displayMode: .inline)
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
                            Text("Account")
                                .font(.system(size: 32))
                                .foregroundColor(.white.opacity(0.8))
                        }
                    )
        }
        }
}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen()
    }
}
