//
//  SideMenuView.swift
//  SideMenu
//
//  Created by ivansaul on 9/16/24.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    @Binding var selectedTab: SideMenuOptionModel
    @State private var selectedOption: SideMenuOptionModel = .dashboard
    var body: some View {
        ZStack {
            if isShowing {
                Color.gray.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }

                HStack {
                    VStack(alignment: .leading, spacing: 20.0) {
                        // Side Menu Header
                        SideMenuHeaderView()
                        // Side Menu Options
                        ForEach(SideMenuOptionModel.allCases) { option in
                            Button(action: {
                                onOptionTapped(option)
                            }, label: {
                                SideMenuRowView(
                                    title: option.title,
                                    systemImageName: option.systemImageName,
                                    isSelected: selectedOption == option
                                )
                            })
                        }

                        Spacer()
                    }
                    .padding()
                    .frame(width: 270)
                    .background(Color.theme.background)

                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: isShowing)
    }
}

#Preview {
    SideMenuView(isShowing: .constant(true), selectedTab: .constant(.profile))
}

extension SideMenuView {
    private func onOptionTapped(_ option: SideMenuOptionModel) {
        selectedOption = option
        selectedTab = option
        isShowing = false
    }
}
