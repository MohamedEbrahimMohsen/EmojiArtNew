//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by Mohamed Mohsen on 4/15/18.
//  Copyright © 2018 Mohamed Mohsen. All rights reserved.
//

import UIKit

class EmojiArtView: UIView, UIDropInteractionDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
        addInteraction(UIDropInteraction(delegate: self))
    }
    
    //Start --- Drop Setion For EmojiArtView
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSAttributedString.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: NSAttributedString.self){ attributedStrings in
            for attributedString in attributedStrings as? [NSAttributedString] ?? []{
                let dropPoint = session.location(in: self)
                self.addLabel(with: attributedString, cenetedAt: dropPoint)
            }
        }
    }
     
    func addLabel(with attributedString: NSAttributedString, cenetedAt point: CGPoint){
        let label = UILabel()
        label.backgroundColor = .clear
        label.attributedText = attributedString
        label.center = point
        label.sizeToFit()
        addEmojiArtGestureRecognizers(to: label)
        addSubview(label)
    }
    
    //End --- Drop Setion For EmojiArtView

    var backgroundImage: UIImage? {
        didSet{
            setNeedsDisplay()
        }
    }
    override func draw(_ rect: CGRect) {
        // Drawing code
        backgroundImage?.draw(in: bounds)
    }

}
