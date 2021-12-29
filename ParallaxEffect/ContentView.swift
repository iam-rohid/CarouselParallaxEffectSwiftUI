//
//  ContentView.swift
//  ParallaxEffect
//
//  Created by Rohid on 29/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var tabIndex = 0
    
    var body: some View {
        TabView(selection: $tabIndex){
            ForEach(0 ..< 12){i in
                GeometryReader {proxy in
                    let minX = proxy.frame(in: .global).minX
                    
                    ZStack {
                        Color.clear
                    }
                        .background(
                            Image("wallpaper\(i+1)")
                                .resizable()
                                .scaledToFill()
                                .offset(x: -minX / 2)
                        )
                        .mask(RoundedRectangle(cornerRadius: 32, style: .continuous))
                        .overlay(
                            ZStack(alignment: .bottom){
                                Color.clear
                                VStack(alignment: .leading){
                                    HStack{
                                        Image("wallpaper\(i+1)")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 48, height: 48)
                                            .mask(Circle())
                                        
                                        VStack{
                                            Text("Jhon Doe")
                                                .font(.title3.weight(.medium))
                                            Text("@jhon_doe")
                                        }
                                        Spacer()
                                        Button{
                                            
                                        }label: {
                                            Image(systemName: "ellipsis")
                                                .font(.title3)
                                                .foregroundColor(Color(UIColor.label))
                                                .frame(width: 32, height: 32, alignment: .center)
                                                .background(Color(UIColor.systemBackground).opacity(0.2))
                                                .mask(Circle())
                                        }
                                    }
                                    .offset(x: minX / 1.5)
                                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                                        .padding(.bottom, 10)
                                        .offset(x: minX / 2)
                                    Button{
                                        
                                    }label: {
                                        Text("Download")
                                            .foregroundColor(.white)
                                            .font(.headline.weight(.bold))
                                            .frame(height: 56)
                                            .frame(maxWidth: .infinity)
                                            .background(Color.accentColor)
                                            .cornerRadius(18)
                                            .offset(x: minX / 3)
                                    }
                                }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
                                    .padding()
                                    .offset(y: 100)
                                    .offset(x: minX / 4)
                            }
                        )
                        .padding()
                    .padding(.bottom, 100)
                }
            }
        }.tabViewStyle(.page(indexDisplayMode: .never))
            .background(
                Image("wallpaper\(tabIndex + 1)")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .blur(radius: 40)
                    .scaleEffect(1.4)
                    .opacity(0.2)
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
