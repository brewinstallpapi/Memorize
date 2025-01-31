//
//  AndysUIButtonStyle.swift
//  Memorize
//
//  Created by Andy Rosa on 1/27/25.
//

import SwiftUI

struct AndysUIButtonStyle: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.caption2)
			.padding(8)
			.overlay(
				RoundedRectangle(cornerRadius: 30)
					.stroke(lineWidth: 2)
			)
			.foregroundColor(Color.blue)
	}
}

extension View {
	func andysUIButtonStyle() -> some View {
		modifier(AndysUIButtonStyle())
	}
}
