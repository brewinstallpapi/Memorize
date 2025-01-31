//
//  GameView.swift
//  Memorize
//
//  Created by Andy Rosa on 1/24/25.
//

import SwiftUI

struct GameView: View {
	
	let emojis = ["🦈","🦈","🐟","🐟","🐠","🐠","🦭","🦭","🪼","🪼","🦑","🦑","🐡","🐡","🐋","🐋","🦀","🦀"].shuffled()
	//var viewModel: GameViewModel
	private var gridItem = GridItem(.adaptive(minimum: 200, maximum: 200))
	var body: some View {
		LazyVGrid(columns: [gridItem, gridItem]) {
			ForEach(0..<8, id: \.self) { card in
				CardView(cardContent: emojis[card])
			}
		}
	}
}

#Preview {
	GameView()
}
