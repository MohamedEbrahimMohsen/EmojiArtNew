//
//  EmojiArt.swift
//  EmojiArt
//
//  Created by Mohamed Mohsen on 4/21/18.
//  Copyright © 2018 Mohamed Mohsen. All rights reserved.
//

import Foundation

struct EmojiArt: Codable{
    var url: URL?
    var emojis = [EmojiInfo]()
    
    struct EmojiInfo: Codable{
        var x: Int //x-position
        var y: Int //y-position
        var text: String //emoji-text
        var size: Int //emoji-fontSize
    }
    
    var json: Data?{
        return try? JSONEncoder().encode(self)
    }
    
    init?(json: Data) {
        if let newValue = try? JSONDecoder().decode(EmojiArt.self, from: json){
            self = newValue
        }else{
            return nil
        }
    }
    
    init(url: URL, emojis: [EmojiInfo]) {
        self.url = url
        self.emojis = emojis
    }
}
