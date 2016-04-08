//
//  ViewController.swift
//  342A1
//
//  Created by Nick on 16/4/6.
//  Copyright © 2016年 Nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TileViewDelegator{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var tileViews : [TileView] = []
        let numOfTiles: Int = 12
        
        let images:[UIImage] = [UIImage(named: "baldhill")!, UIImage(named: "cathedral")!, UIImage(named: "lake")!]
        var instance : GameModel = GameModel(totalTileNumber: numOfTiles, images: images)
        print(instance)
        
        for i in 1...numOfTiles {
            var tileView = view.viewWithTag(i) as! TileView
            tileViews.append(tileView)
            tileView.delegator = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didSelectTile(tileView: TileView){
    
    }
}

