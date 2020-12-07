//
//  AppSidebarNavigation.swift
//  iosApp (iOS)
//
//  Created by Marco Gomiero on 08/11/2020.
//

import SwiftUI

enum SidebarNavigationItem {
    case home
    case recap
    case budget
    case settings
}

struct AppSidebarNavigation: View {

    
    @State private var selection: SidebarNavigationItem? = .home
    
    var sidebar: some View {
        
        VStack {

            NavigationLink(
                destination: HomeScreen(),
                tag: SidebarNavigationItem.home,
                selection: $selection,
                label: {
                    SidebarMenuItem(currentSelection: $selection,
                                    imageName: "house",
                                    textString: "Home",
                                    itemSelection: .home)
                })
                .buttonStyle(PlainButtonStyle())

            NavigationLink(
                destination: RecapScreen(),
                tag: SidebarNavigationItem.recap,
                selection: $selection,
                label: {
                    SidebarMenuItem(currentSelection: $selection,
                                    imageName: "chart.pie",
                                    textString: "Recap",
                                    itemSelection: .recap)
                })
                .buttonStyle(PlainButtonStyle())

            NavigationLink(
                destination: BudgetScreen(),
                tag: SidebarNavigationItem.budget,
                selection: $selection,
                label: {
                    SidebarMenuItem(currentSelection: $selection,
                                    imageName: "banknote",
                                    textString: "Budget",
                                    itemSelection: .budget)
                })
                .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            // TODO: show a modal sheet!
            NavigationLink(
                destination: SettingsScreen(),
                tag: SidebarNavigationItem.settings,
                selection: $selection,
                label: {
                    SidebarMenuItem(currentSelection: $selection,
                                    imageName: "gear",
                                    textString: "Settings",
                                    itemSelection: .settings)
                })
                .buttonStyle(PlainButtonStyle())

        }
        .navigationBarTitle("Money Flow")
    }
    
    var body: some View {
        NavigationView {
            sidebar
        }
    }
}