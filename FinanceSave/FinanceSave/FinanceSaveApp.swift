//
//  FinanceSaveApp.swift
//  FinanceSave
//
//  Created by yusuf on 16.12.2023.
//

import SwiftUI

@main
struct FinanceSaveApp: App {
    var body: some Scene {
                WindowGroup {
                    let dataManager = DataManager()
                    HomeView(dataManager: dataManager)
                }
            }
}
