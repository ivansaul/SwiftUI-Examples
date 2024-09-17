//
//  ContentView.swift
//  SideMenu
//
//  Created by ivansaul on 9/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu: Bool = false
    @State private var selectedTab: SideMenuOptionModel = .dashboard
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectedTab) {
                    ForEach(SideMenuOptionModel.allCases) { option in
                        DetailView(systemImageName: option.systemImageName)
                            .tag(option)
                    }
                }

                SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
            }
            .navigationTitle(selectedTab.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
