
//
//  MemoryGame.swift
//  Memorize
//
//  Created by Tapan Patel on 12/07/20.
//  Copyright © 2020 Tapan Patel. All rights reserved.
//

import Foundation


struct MemoryGame<CardContent> where CardContent : Equatable
{
    var cards:Array<Card>
    
    var indexOfOneAndOnlyFaceUpCard:Int?
    {
        get{
            return cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set{
            for index in cards.indices
            {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    
    mutating func choose(card:Card)
    {
        print("The chosen card is : \(card)")
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched
        {
            if let potentialIndex = indexOfOneAndOnlyFaceUpCard
            {
                if cards[chosenIndex].cardContent == cards[potentialIndex].cardContent
                {
                    cards[chosenIndex].isMatched = true
                    cards[potentialIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            }
            else
            {
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
        }
        
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
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var cardContent:CardContent
        var id:Int
    }
}


















