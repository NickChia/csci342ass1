//
//  ViewController.swift
//  342A1
//
//  Created by Nick on 16/4/6.
//  Copyright © 2016年 Nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let images:[UIImage] = [UIImage(named: "baldhill")!, UIImage(named: "cathedral")!, UIImage(named: "lake")!]
        var instance : GameModel = GameModel(totalTileNumber: 12, images: images)
        print(instance)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

