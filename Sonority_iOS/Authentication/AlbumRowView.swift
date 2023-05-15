//
//  InputView.swift
//  Sonority
//
//  Created by Ayaan on 11/05/23.
//

import SwiftUI

struct AlbumRowView: View {

    
    var body: some View {
        HStack{
            Image(systemName: "photo.artframe")
                .font(.system(size: 45))
            
            VStack{
                Text("Album Name")
                    .font(.system(size:20))
                Text("Artist Name")
                    .font(.system(size:15))
            }
            .padding(.horizontal)
            .padding(.vertical, 20)
            
            CircularProgressBar()
                .frame(width: 100.0, height: 100.0)
        }
        .background(
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(inpColor.opacity(0.8)))
        .padding(.horizontal)
        .frame(width:550, height: 100)

    }
    struct AlbumRowView_Previews: PreviewProvider {
        static var previews: some View {
            AlbumRowView()
        }
    }

}

struct CircularProgressBar: View {
    @State private var progress: Double = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.3)
                .foregroundColor(Color.gray)

            Circle()
                .trim(from: 0.0, to: CGFloat(progress))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(lgColor)
                .rotationEffect(Angle(degrees: -90.0))

            Text("\(Int(progress * 100.0))%")
                .font(.system(size:18))
                .bold()

        }
        .padding()
        .onReceive(timer) { _ in
            if progress < 1.0 {
                progress += 0.01
            } else {
                timer.upstream.connect().cancel()
            }
        }
    }
}

    
