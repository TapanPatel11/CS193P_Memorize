//
//  ContentView.swift
//  Memorize
//
//  Created by Tapan Patel on 12/07/20.
//  Copyright © 2020 Tapan Patel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel:EmojiMemoryGame
    var body: some View {
        Grid(viewModel.cards){   card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
        .padding(5)
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View
{
    var card:MemoryGame<String>.Card
    var body:some View
    {
        GeometryReader {  geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size:CGSize) -> some View
    {
        
        if card.isFaceUp || !card.isMatched
        {
            ZStack{
                Pie(startAngle: Angle.degrees( 0-90), endAngle: Angle.degrees( 110-90), clockWise: true).padding(5).opacity(0.4)
                Text(self.card.cardContent)
                    .font(Font.system(size: fontSize(for: size)))
            }.cardify(isFaceUp : card.isFaceUp)
        }
        
       
        
        
    }
    
    
    
    //MARK: - Drawing Constants
   
    private func fontSize(for size:CGSize) ->CGFloat
    {
        return min(size.width,size.height) * 0.75
    }
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])   
        return ContentView(viewModel: game)
    }
}
