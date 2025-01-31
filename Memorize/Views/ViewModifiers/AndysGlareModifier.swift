//
//  AndysGlareEffectModifier.swift
//  Memorize
//
//  Created by Andy Rosa on 1/29/25.
//

import SwiftUI

struct AndysGlare: ViewModifier {
	@State private var moveGradient = true
	let screenWidth = UIScreen.main.bounds.width
	func body(content: Content) -> some View {
		content
			.overlay {
				LinearGradient(colors: [.clear, .white, .clear], startPoint: .leading, endPoint: .trailing)
					.frame(width: 50)
					.offset(x: moveGradient ? -screenWidth/2 : screenWidth/2)
			}
			.animation(.easeInOut(duration: 5).repeatForever(autoreverses: false), value: moveGradient)
			.mask {
			//	cardBase.strokeBorder(lineWidth: 5)
				content
			}
			.onAppear {
				self.moveGradient.toggle()
			}
	}
}

extension View {
	public func glareEffect() -> some View {
		modifier(AndysGlare())
	}
}

#Preview {
	MainView()
}
