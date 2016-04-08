//
//  GameModel.swift
//  342A1
//
//  Created by Nick on 16/4/6.
//  Copyright © 2016年 Nick. All rights reserved.
//

import Foundation
import UIKit

class GameModel
{
    //part1 a:
    struct TileData
    {
        var tileImage : UIImage
        var imageId : Int
    }
    
    //part1 b:
    var lastIndex: Int
    var secLastIndex: Int
    var initalGameState: [TileData]
    var isFirstTurn : Bool
    var matchedTileNumber : Int
    //var delegtor : modelDelegator?//delegate ?
    var score: Int
    
    var totalTileNumber : Int
    var images :[String]
    
    //part1 c:
    init(totalTileNumber: Int,  images: [String]){
        self.totalTileNumber = totalTileNumber
        self.images = images
    }
    
    func reset(){
        isFirstTurn = true
        matchedTileNumber = 0
        
    }
    
}

protocol gameDelegator{
    func gameDidComplete(gameModel : GameModel)
    func didMatchTile(gameModel : GameModel, tileIndex : Int, previousTileIndex: Int)
    func didFailToMatchTile(gameModel : GameModel, tileIndex : Int, previousTileIndex:Int)
    func scoreDidUpdate(gameModel : GameModel, newScore: Int)
}
