//
//  CardView.swift
//  Memorize
//
//  Created by Andy Rosa on 1/24/25.
//

import SwiftUI

struct CardView: View {
	@State var isFaceUp: Bool = false
	@State private var glareOffset: CGFloat = -150
	var cardContent: String = "🦈"
	var cardBase = RoundedRectangle(cornerSize: (CGSize(width: 95, height: 65)))
	let silverGradient =  LinearGradient(
		gradient: Gradient(colors: [
			Color.white,
			Color(red: 0.9, green: 0.9, blue: 0.9),
			Color.gray,
			Color(red: 0.7, green: 0.7, blue: 0.7),
			Color.white
		]),
		startPoint: .topLeading,
		endPoint: .bottomTrailing
	)
	let silverGradient2 = LinearGradient(
		gradient: Gradient(colors: [
			Color.white,
			Color(red: 0.9, green: 0.9, blue: 0.9),
			Color.black,
			Color(red: 0.7, green: 0.7, blue: 0.7),
			Color.white
		]),
		startPoint: .topLeading,
		endPoint: .bottomTrailing
	)
	
	var body: some View {
		
		ZStack {
			if isFaceUp {
				cardBase.fill(.white)
				cardBase.strokeBorder(lineWidth: 5)
					.foregroundStyle(silverGradient2)
				Text(cardContent)
					.font(.system(size: 120))
					.padding(.vertical, 50)
			} else {
				cardBase.fill(.cyan)
				cardBase.strokeBorder(lineWidth: 5)
					.rotationEffect(.degrees(180))
					.scaleEffect(x: -1, y: 1)
					.foregroundStyle(silverGradient2)
					.glareEffect()
				Text("≬")
					.font(.system(size: 90))
					.padding(.vertical, 50)
					//	.rotationEffect(.degrees(180))
					.scaleEffect(x: -1, y: 1)
					.foregroundStyle(silverGradient)
					.glareEffect()
			}
		}
		.aspectRatio(3/4, contentMode: .fit)
		.rotation3DEffect(.degrees(isFaceUp ? 0 : 180), axis: (0, 1, 0))
		.animation(.easeInOut(duration: 0.3), value: isFaceUp)
		.onTapGesture (perform: {
			isFaceUp.toggle()
		})
	}
}

#Preview {
	MainView()
}
