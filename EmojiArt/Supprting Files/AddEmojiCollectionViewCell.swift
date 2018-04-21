//
//  AddEmojiCollectionViewCell.swift
//  EmojiArt
//
//  Created by Mohamed Mohsen on 4/20/18.
//  Copyright © 2018 Mohamed Mohsen. All rights reserved.
//

import UIKit

class AddEmojiCollectionViewCell: UICollectionViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var addEmojiTextField: UITextField!{
        didSet{
            addEmojiTextField.delegate = self
        }
    }
    
    var resignationHandller: (() -> Void)?
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        resignationHandller?()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addEmojiTextField.resignFirstResponder()
        return true
    }
}
