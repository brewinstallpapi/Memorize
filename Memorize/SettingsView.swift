//
//  SettingsView.swift
//  Memorize
//
//  Created by Andy Rosa on 1/24/25.
//

import SwiftUI

struct SettingsView: View {
	@AppStorage("isDarkMode")var isDarkMode: Bool = true
	var body: some View {
		NavigationStack {
			Form {
				Toggle("Toggle Dark Theme", isOn: $isDarkMode)
			}
			.navigationTitle("Settings")
		}
		
	}
}


#Preview {
	SettingsView()
}

#Preview {
	MainView()
}
