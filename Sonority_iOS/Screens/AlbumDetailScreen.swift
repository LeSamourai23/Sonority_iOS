//
//  AlbumDetailScreen.swift
//  Sonority_iOS
//
//  Created by Ayaan on 12/05/23.
//

import SwiftUI

struct AlbumDetailScreen: View {
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                
                Image("HomescreenBG")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width:geo.size.width, height:geo.size.height, alignment: .top)
                    .opacity(1)
                
                ScrollView {
                    VStack {
                        VStack{
                            Image("album-5")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Text("DAMN.")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("Kendrick Lamar")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        
                        VStack{
                            
                        }
                        
                        VStack{
                            /*ForEach(album.tracks) { track in
                             HStack {
                             Text(track.title)
                             .fontWeight(.semibold)
                             Spacer()
                             Text(track.duration)
                             .foregroundColor(.gray)
                             }
                             .padding(.vertical, 8)
                             }*/
                        }
                    }
                    .padding(.horizontal, 50)
                    .padding(.vertical, 60)
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct AlbumDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailScreen()
    }
}
