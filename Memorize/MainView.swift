//
//  MainView.swift
//  Memorize
//
//  Created by Andy Rosa on 12/24/24.
//

import SwiftUI

struct MainView: View {
	@AppStorage("isDarkMode") var isDarkMode: Bool = false
	var body: some View {
		TabView {
			Tab("Play!", systemImage: "gamecontroller") {
				NavigationStack {
					VStack {
						ScrollView {
							GameView()
						}
						.padding(.horizontal, 6)
						
						HStack {
							Text("Score: 0")
								.font(.largeTitle)
							Spacer()
							Button(action: shuffle) {
								Text("Shuffle")
									.font(.largeTitle)
									.andysUIButtonStyle()
							}
						}
						.padding()						
					}
					.navigationTitle("Memorize").navigationBarTitleDisplayMode(.inline)
				}
			}
			Tab("Settings", systemImage: "gear") {
				SettingsView()
			}
		}
		.preferredColorScheme(isDarkMode ? .dark : .light)
	}
	
	private func shuffle() -> Void {
			//Aquí es que iría el código para barajar las cartas, este método creo que tendría que "vivir" en el view model en algun lado
	}
}

#Preview {
	MainView()
}
