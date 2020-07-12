//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Tapan Patel on 12/07/20.
//  Copyright © 2020 Tapan Patel. All rights reserved.
//

import Foundation

class EmojiMemoryGame
{
    private var model:MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String>
    {
        let emojis = ["🍎","🌟","🍊"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { (index) -> String in
            return emojis[index]
        }
    }
    
    
    // MARK: - Access to the model
    var cards:Array<MemoryGame<String>.Card>
    {
        return model.cards
    }
    
    func choose(card:MemoryGame<String>.Card)
    {
        model.choose(card: card)
    }
}
