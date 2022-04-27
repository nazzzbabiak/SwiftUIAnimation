//
//  Albom.swift
//  AnimatedSwiftUiTry
//
//  Created by Nazar Babyak on 16.03.2022.
//

import SwiftUI

struct Album: Identifiable {
    var id = UUID().uuidString
    var albumName: String
    var albumImage: String
    var isLiked: Bool = false
}


var albums: [Album] = [
    
    Album(albumName: "FolderOne", albumImage: "image-1", isLiked: true),
    Album(albumName: "FolderTwo", albumImage: "image-2"),
    Album(albumName: "FolderThree", albumImage: "image-3", isLiked: true),
    Album(albumName: "FolderFour", albumImage: "image-4"),
    Album(albumName: "FolderFive", albumImage: "image-5"),
    Album(albumName: "FolderSix", albumImage: "image-6"),
    Album(albumName: "FolderSeven", albumImage: "image-7", isLiked: true),
    Album(albumName: "FolderEigth", albumImage: "image-8", isLiked: true),
    Album(albumName: "FolderNine", albumImage: "image-9", isLiked: false),
    Album(albumName: "FolderTen", albumImage: "image-10", isLiked: true),
  
]
