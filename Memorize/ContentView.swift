	//
	//  ContentView.swift
	//  Memorize
	//
	//  Created by Andy Rosa on 12/24/24.
	//

import SwiftUI

struct MainView: View {
	@State var cardCount: Int = 20
	let emojis: Array<String> = ["😀", "🐶", "🌟", "🍎", "🚀", "🎵", "⚽️", "🌈", "🔥", "🍩", "🐵", "🦄", "🍔", "🚴‍♂️", "🎨", "🎯", "🌸", "🎃", "🏖️", "🛸", "🐙", "🍉", "⛷️", "🏰", "🎆", "🦋", "🛵", "🥑", "📚", "💎"]
	
	var cards: some View {
		ScrollView (content:{
			LazyVGrid(columns:[GridItem(),GridItem()] ,content:{
				ForEach(0..<cardCount, id: \.self) { index in
					CardView(cardContent:emojis[index])
				}
			})
		})
	}
	
	var body: some View {
		VStack {
			cards
			HStack(content:{
				Button(action: {
					cardCount -= 1
				}, label: {
					Image(systemName: "folder.fill.badge.minus")
				})
				.disabled(cardCount < 2)
				Spacer()
				Button(action: {
					cardCount += 1
				}, label: {
					Image(systemName: "folder.fill.badge.plus")
				})
				.disabled(cardCount > emojis.count - 1)
			})
			.font(.largeTitle)
		}
		.padding()
	}
}

struct CardView: View {
	@State var isFaceUp: Bool = true
	var cardContent: String = "🦈"
	var cardBase = RoundedRectangle(cornerRadius: 20)
	var body: some View {
		ZStack(content:{
			if isFaceUp {
				cardBase.fill(.white)
				cardBase.strokeBorder(lineWidth: 10)
					.foregroundStyle(.cyan)
				Text(cardContent)
					.font(.largeTitle)
			} else {
				cardBase
					.foregroundStyle(.cyan)
			}
		})
		.onTapGesture (perform: {
			isFaceUp.toggle()
		})
	}
}

#Preview {
	MainView()
}
