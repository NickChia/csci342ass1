//
//  TileView.swift
//  342A1
//
//  Created by Nick on 16/4/8.
//  Copyright © 2016年 Nick. All rights reserved.
//

import UIKit

class TileView: UIView {
    
    var image : UIImage?
    var imageView : UIImageView
    var delegator : TileViewDelegator?
    var tileIndex : Int?
    
    var touchAction : UITapGestureRecognizer?
    
    required init?(coder aDecoder: NSCoder){
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height:45))
        imageView.image = UIImage(named: "question")!
        
        super.init(coder: aDecoder)
        
        touchAction = UITapGestureRecognizer(target: self, action: "touch")
        tileIndex = self.tag
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let width = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        
        let height = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        
        let top = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        
        let left = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        
        addConstraints([width, height, top, left])
        
        addGestureRecognizer(touchAction!)
        
    }
    
    func revealImage(){
        imageView.image = UIImage(named: "lake")
    }
    
    func coverImage(){
        imageView.image = UIImage(named: "question")
    }
    
    func hideImage(){
        
    }
    
    func touch(){
        delegator?.didSelectTile(self)
        image = UIImage(named: "lake")
        imageView.image = image
        
    }
}


protocol TileViewDelegator{
    func didSelectTile(tileView: TileView)
}
