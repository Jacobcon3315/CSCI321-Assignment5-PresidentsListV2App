//
//  PresidentsListV2App.swift
//  PresidentsListV2
//
//  Created by Madi Lumsden on 11/14/22.
//

import SwiftUI

@main
struct PresidentsListV2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
