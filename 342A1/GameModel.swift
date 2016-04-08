//
//  GameModel.swift
//  342A1
//
//  Created by Nick on 16/4/6.
//  Copyright © 2016年 Nick. All rights reserved.
//

import Foundation
import UIKit

class GameModel: CustomStringConvertible
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
    var initialGameState: [TileData] = []
    
    var isFirstTurn : Bool
    var matchedTileNumber : Int
    var delegtor : gameDelegator?
    var score: Int
    
    var totalTileNumber : Int
    var images : [UIImage]
    
    //part1 c:
    init(totalTileNumber: Int,  images: [UIImage]){
        lastIndex = 0
        secLastIndex = 0
        isFirstTurn = true
        matchedTileNumber = 0
        score = 0
        
        self.totalTileNumber = totalTileNumber
        self.images = images
        
        reset()
    }
    
    func reset(){
        lastIndex = 0
        secLastIndex = 0
        isFirstTurn = true
        matchedTileNumber = 0
        score = 0
        
        var index :Int = 0
        for i in 0..<totalTileNumber/2 {
            if index > 2 {
                index = 0
            }
            initialGameState.append(TileData(tileImage: images[index], imageId : index))
            initialGameState.append(TileData(tileImage: images[index], imageId : index))
            index += 1
        }
        
        //Shuffle
        for i in 1..<totalTileNumber {
            swap(&initialGameState[i], &initialGameState[Int(arc4random_uniform(UInt32(i-1)))])
        }

    }
    
    var description: String{
        var desc: String = ""
        for i in 0..<initialGameState.count {
            desc += " " + String(initialGameState[i].imageId)
        }
        return desc
    }
    
}

protocol gameDelegator{
    func gameDidComplete(gameModel : GameModel)
    func didMatchTile(gameModel : GameModel, tileIndex : Int, previousTileIndex: Int)
    func didFailToMatchTile(gameModel : GameModel, tileIndex : Int, previousTileIndex:Int)
    func scoreDidUpdate(gameModel : GameModel, newScore: Int)
}
