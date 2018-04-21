//
//  Document.swift
//  EmojiArt
//
//  Created by Mohamed Mohsen on 4/21/18.
//  Copyright © 2018 Mohamed Mohsen. All rights reserved.
//

import UIKit

class Document: UIDocument {
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
    }
}

