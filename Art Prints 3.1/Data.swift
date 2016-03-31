//
//  Data.swift
//  Art Prints 3.1
//
//  Created by Justin Doo on 8/1/15.
//  Copyright (c) 2015 Justin Doo. All rights reserved.
//

import Foundation


class Data {
    class Entry {
        let artImage : String
        let  artistName : String
        let images: [String]
        let website : String
        
        init(artImage : String, artistName : String, images : [String], website : String) {
            self.artistName = artistName
            self.artImage = artImage
            self.images = images
            self.website = website
        }
    }
    
    let artPosters = [
        Entry(artImage: "Olly Moss", artistName: "Olly Moss", images: ["Olly Moss","Olly-Moss-Empire","Olly Moss Jedi","Olly Moss Dark Knight", "Olly Moss Dark Knight Rises","The Evil Dead moss","Olly Moss Ghibli","Olly Moss Spirited Away","Olly Moss harrypotter"], website: "http://www.ollymoss.com/"),
        Entry(artImage: "Ken Taylor", artistName: "Ken Taylor",images: ["Ken Taylor","ken taylor Jurrasic","basterds taylor.png","drive taylor.png","watchmen taylor.png","where the wild things are taylor.png"], website: "http://www.kentaylor.com.au/"),
        Entry(artImage: "Dan McCarthy", artistName: "Dan McCarthy", images: ["Dan McCarthy","star_wars_mondo_mcarthy.png"], website: "http://www.omgposters.com/tag/dan-mccarthy/"),
        Entry(artImage: "JC Richard", artistName: "JC Richard", images: ["JC Richard","JC-Richard.png","jc richard_the forest sentries_800a.png"], website: "http://www.microcosmicmedia.blogspot.com/"),
        Entry(artImage: "Martin Ansin", artistName: "Martin Ansin", images: ["Martin Ansin","ansin-man-of-steel","brazil ansin","Martin-Ansin-Looper","taxi ansin", "blade runner ansin"], website: "http://www.martinansin.com/")
    ]
    
}
