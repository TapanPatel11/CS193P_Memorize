//
//  MemoryGame.swift
//  Memorize
//
//  Created by Tapan Patel on 12/07/20.
//  Copyright © 2020 Tapan Patel. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent>
{
    var cards:Array<Card>
    
    func choose(card:Card)
    {
        print("The chosen card is : \(card)")
    }
    
    init(numberOfPairsOfCards:Int,cardContentFactory : (Int)->CardContent) {
        cards = Array<Card>()
        for index in 0..<numberOfPairsOfCards
        {
            let content = cardContentFactory(index)
            cards.append(Card(cardContent: content, id: index*2))
            cards.append(Card(cardContent: content, id: index*2+1))
        }
    }
    struct Card:Identifiable
    {
        var isFaceUp:Bool = true
        var isMatched:Bool = false
        var cardContent:CardContent
        var id:Int
    }
}
