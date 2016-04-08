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
    var tileTag : Int?
    
    var touchAction : UITapGestureRecognizer?
    
    required init?(coder aDecoder: NSCoder){
        //initial view image
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height:45))
        imageView.image = UIImage(named: "question")!
        
        super.init(coder: aDecoder)
        
        //register touchAction
        touchAction = UITapGestureRecognizer(target: self, action: "touch")
        tileTag = self.tag
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let width = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        let top = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        
        //add constraints
        addConstraints([width, height, top, left])
        
        //add action listener
        addGestureRecognizer(touchAction!)
        
    }
    
    func revealImage(){
        imageView.image = image
        //self.hidden = false
    }
    
    func coverImage(){
        imageView.image = UIImage(named: "question")
    }
    
    func hideImage(){
        imageView.hidden = true
        removeGestureRecognizer(touchAction!)
    }
    
    func touch(){
        delegator?.didSelectTile(self)
    }
    
    func addGesture() {
         addGestureRecognizer(touchAction!)
    }
}


protocol TileViewDelegator{
    func didSelectTile(tileView: TileView)
}
