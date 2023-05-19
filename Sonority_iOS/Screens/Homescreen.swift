//
//  Homescreen.swift
//  Sonority
//
//  Created by Ayaan on 11/05/23.
//

import SwiftUI

struct Homescreen: View {
    @State private var isSearching = false
    @State private var searchText = ""
    @State private var searchResults: [Albums] = []
    @EnvironmentObject private var albumNetworkModel: AlbumNetworkModel
    var albums = loadCSV(from: "output")
    
    var filteredResults: [Albums] {
        if searchText.isEmpty {
            return searchResults
        } else {
            return searchResults.filter { $0.album.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView{
            GeometryReader{ geo in
                ZStack{
                    
                    Image("HomescreenBG")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width:geo.size.width, height:geo.size.height, alignment: .top)
                        .opacity(1)
                    
                    VStack(spacing:50) {
                        
                        HStack {
                            NavigationLink(destination: AccountScreen()) {
                                Image(systemName: "person.circle")
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.system(size: 32))
                            }
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true)
                            
                            Spacer()
                            
                            NavigationLink(destination: SettingScreen()) {
                                Image(systemName: "gearshape")
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.system(size: 32))
                            }
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true)
                            
                            
                        }
                        .padding(.horizontal)
                        .padding(.top, 50)
                        .opacity(isSearching ? 0 : 1)
                        .animation(.easeInOut(duration: 0.3))
                        
                        Spacer()
                        
                        VStack(spacing:0){
                            
                            VStack(spacing:30){
                                VStack{
                                    Text("Find your next favourite album")
                                        .foregroundColor(.white.opacity(0.7))
                                    Text("with")
                                        .foregroundColor(.white.opacity(0.7))
                                }
                                
                                Image("Logo")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:300, height:74, alignment: .center)
                                    .edgesIgnoringSafeArea(.all)
                                    .opacity(1.0)
                                
                                
                                Spacer()
                                    .frame(height:20)
                            }
                            .padding(.top, 0)
                            .opacity(isSearching ? 0 : 1)
                            .animation(.easeInOut(duration: 0.3))
                            
                            
                            /*HStack {
                                TextField("Search", text: $searchKeyword,onEditingChanged: { isEditing in
                                    withAnimation {
                                        self.isSearching = isEditing
                                    }
                                }, onCommit: {
                                    // Perform search action
                                })
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                .padding(.vertical, 20)
                                .background(
                                    RoundedRectangle(cornerRadius: 40)
                                        .foregroundColor(inpColor.opacity(0)))
                                .padding(.horizontal)
                                
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.white)
                                
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 4)
                            .background(inpColor.opacity(0.9))
                            .cornerRadius(50)
                            .padding(.top, isSearching ? -320 : 0)*/
                            
                            VStack {
                                HStack {
                                    TextField("Search", text: $searchText, onEditingChanged: { isEditing in
                                        withAnimation {
                                            self.isSearching = isEditing
                                        }
                                    }, onCommit: {
                                        // Perform search action
                                    })
                                        .foregroundColor(.white)
                                        .padding(.horizontal)
                                        .padding(.vertical, 20)
                                        .background(
                                            RoundedRectangle(cornerRadius: 40)
                                                .foregroundColor(inpColor.opacity(0)))
                                        .padding(.horizontal)

                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 4)
                                .background(inpColor.opacity(0.9))
                                .cornerRadius(50)
                                    
                                List(filteredResults, id: \.self) { album in
                                    NavigationLink(destination: DetailView(album: album, albumsData: searchResults)) {
                                        Text(album.album)
                                            .foregroundColor(.white)
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .listRowBackground(Color.black)
                                    .foregroundColor(bgColor)
                                    .listRowInsets(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                }
                                .listStyle(PlainListStyle())
                                .environment(\.defaultMinListRowHeight, 50)
                                .opacity(isSearching ? 1 : 0)
                                .background(Color.clear) // Set the background color of the entire view hierarchy to clear
                                .edgesIgnoringSafeArea(.all) // Ignore safe area insets
                        }
                        .padding(.top, isSearching ? -320 : 0)
                            
                            Spacer()
                        }
                        .onAppear {
                            searchResults = loadCSV(from: "output")}
                    }
                    .ignoresSafeArea()
                }
        }
        .ignoresSafeArea()
    }
}

    struct Homescreen_Previews: PreviewProvider {
        static var previews: some View {
            Homescreen()
        }
    }
}


