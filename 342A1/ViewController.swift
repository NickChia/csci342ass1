//
//  ViewController.swift
//  342A1
//
//  Created by Nick on 16/4/6.
//  Copyright © 2016年 Nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TileViewDelegator, gameDelegator{
    
    var instance : GameModel
    var tileViews : [TileView] = []
    let numOfTiles: Int = 12
    
    @IBOutlet weak var score: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        let images:[UIImage] = [UIImage(named: "baldhill")!, UIImage(named: "cathedral")!, UIImage(named: "lake")!]
        instance = GameModel(totalTileNumber: numOfTiles, images: images)
        super.init(coder: aDecoder)
        print(instance)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in 1...numOfTiles {
            //cast ui view to TileView
            var tileView = view.viewWithTag(i) as! TileView
            tileViews.append(tileView)
            tileView.delegator = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //deal image touch event
    func didSelectTile(tileView: TileView){
        tileView.imageView.image = instance.initialGameState[tileView.tileTag! - 1].tileImage
        if instance.isFirstTurn {
            instance.lastIndex = tileView.tag
        }
        else{
            instance.pushTileIndex(tileView.tag)
        }
        instance.isFirstTurn = !instance.isFirstTurn
        didMatchTile()
    }
    
    //deal game over event
    func gameDidComplete(){
        if instance.matchedTileNumber == 6 {
            let time = 1 * Double(NSEC_PER_SEC)
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(time))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                self.showResult()
                self.instance.reset()
                self.score.text = "Score"
            
                for tile in self.tileViews
                {
                    tile.imageView.image = UIImage(named: "question")!
                    tile.imageView.hidden = false
                    tile.addGesture()
                }
            }
        }
    }
    
    //deal tiles matching
    func didMatchTile(){
        if instance.isFirstTurn
        {
           if instance.initialGameState[instance.secLastIndex - 1].imageId == instance.initialGameState[instance.lastIndex - 1].imageId && instance.secLastIndex != instance.lastIndex
            {
                let time = 1 * Double(NSEC_PER_SEC)
                let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(time))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    self.tileViews[self.instance.secLastIndex - 1].hideImage()
                    self.tileViews[self.instance.lastIndex - 1].hideImage()
                }
                scoreDidUpdate(200)
                instance.matchedTileNumber += 1
                gameDidComplete()
            }
            else
           {
                didFailToMatchTile()
            }
        }

    }
    
    //deal tiles not matched
    func didFailToMatchTile(){
        let time = 1 * Double(NSEC_PER_SEC)
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(time))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.tileViews[self.instance.secLastIndex - 1].coverImage()
            self.tileViews[self.instance.lastIndex - 1].coverImage()
        }
        scoreDidUpdate(-100)
    }
    
    //update score
    func scoreDidUpdate(newScore: Int){
        instance.score += newScore
        score.text = "Score: " + String(instance.score)
    }
    
    //show final scores
    func showResult() {
        let msg = "You get: " + String(self.instance.score) + " score"
        let alertController = UIAlertController(title: "Finished", message:
            msg, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}

