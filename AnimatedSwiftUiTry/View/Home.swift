//
//  Home.swift
//  AnimatedSwiftUiTry
//
//  Created by Nazar Babyak on 16.03.2022.
//

import SwiftUI

struct Home: View {
    
    @State private var currentString: String = "SomeOne"
    
    @Namespace var animation
    
    @State var _albums: [Album] = albums
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                HeadReader()
                
                
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    //
                    Section {
                        //
                        AlbumList()
                            .padding(.leading, 10)
                    } header: {
                        //
                        PinnedHeader()
                            .background(Color.black)
                        
                    }
                }
            }
        }
        .coordinateSpace(name: "SCROLL")
        .ignoresSafeArea(.container, edges: .vertical)
    }
    @ViewBuilder
    func AlbumList()->some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20.0) {
                ForEach($_albums) { $album in
                    
                    
                    HStack {
                        
                        VStack(alignment: .center) {
                            Image(album.albumImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width / 3, height: .infinity)
                                .cornerRadius(15)
                                .contextMenu(menuItems: {
                                    Button(action: {
                                        //
                                    }, label: {
                                        
                                        HStack {
                                            Text("Send to")
                                            Spacer()
                                            Image(systemName: "paperplane")
                                        }
                                    })
                                    Button(action: {
                                        //
                                    }, label: {
                                        HStack {
                                            Text("Rename")
                                            Spacer()
                                            Image(systemName: "arrow.left.arrow.right")
                                        }
                                    })
                                    
                                    Button(action: {
                                        //
                                    }, label: {
                                        HStack {
                                            Text("Save as")
                                            Spacer()
                                            Image(systemName: "folder")
                                        }
                                    })
                                    
                                    Button(action: {
                                        //
                                    }, label: {
                                        HStack {
                                            Text("Delete")
                                            Spacer()
                                            Image(systemName: "trash")
                                        }
                                    })
                                })
                                .overlay{
                                    VStack {
                                    Button {
                                        //
                                        withAnimation(.easeInOut) {
                                            album.isLiked.toggle()
                                        }
                                    } label: {
                                        Image(systemName: album.isLiked ? "heart.fill" : "heart")
                                            .font(.system(size: 20, weight: .thin, design: .monospaced))
                                            .foregroundColor(album.isLiked ? Color("background") : Color.white)
                                    }
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                    .padding()
                                    //.background(Color.white)
                                    
                                }
                                
                            
                            HStack {
                                Text(album.albumName)
                                    .font(.system(size: 15, weight: .thin, design: .monospaced))
                            }
                            .padding(.top, 10)
                            .padding(.horizontal, 5)
                        }
                    }
                }
            }
            .padding(.top, 25)
        }
    }
    
    
    @ViewBuilder
    func HeadReader()->some View{
        GeometryReader{ proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let size = proxy.size
            let height = (size.height + minY)
            
            Image("MyFoto")
                .resizable()
                .scaledToFill()
                .frame(width: size.width, height: height, alignment: .top)
                .overlay(content: {
                    
                    ZStack(alignment: .bottom) {
                        LinearGradient(gradient: Gradient(colors: [.clear, .clear]), startPoint: .top, endPoint: .bottom)
                        
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Nazar")
                            
                                .font(.system(size: 20, weight: .semibold, design: .monospaced))
                            
                            
                            HStack(spacing: 10) {
                                Text("*Some Text")
                                    .font(.system(size: 15, weight: .light, design: .monospaced))
                                Spacer()
                                Image(systemName: "person.crop.rectangle.stack")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 22, height: 22)
                                    .foregroundColor(Color.green.opacity(0.6))
                                
                            }
                        }
                        .frame(height: .infinity)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        
                        .background(.ultraThinMaterial).opacity(0.8)
                        .cornerRadius(15)
                        .padding(.horizontal, 5)
                        .padding(.bottom, 5)
                    }
                })
                .cornerRadius(15)
                .offset(y: -minY)
        }
        .frame(height: 250)
    }
    
    @ViewBuilder
    func PinnedHeader()->some View {
        
        let types: [String] = ["SomeOne", "SomeTwo", "SomeThree", "SomeFour", "SomeFive"]
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 25) {
                ForEach(types, id: \.self) { type in
                    
                    VStack(spacing: 12){
                        
                        Text(type)
                            .font(.system(size: 15, weight: .thin, design: .monospaced))
                            .foregroundColor(currentString == type ? Color.white : Color.gray)
                        
                        ZStack {
                            if currentString == type {
                                RoundedRectangle(cornerRadius: 4, style: .continuous)
                                    .fill(Color.white )
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            } else {
                                RoundedRectangle(cornerRadius: 4, style: .continuous)
                                    .fill(Color.clear)
                            }
                        }
                        .padding(.horizontal, 10)
                        .frame(height: 3)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.spring()) {
                            currentString = type
                        }
                    }
                    
                }
            }
            
        }
        
        .padding(.top)
        .padding(.horizontal)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
