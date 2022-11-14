//
//  PresidentsListModelView.swift
//  PresidentsList
//
//  Created by Jacob Conacher on 11/14/22.
//

import Foundation

//Grabs the data from the plist file "presidents" and decodes it using the created decoder
class PresidentsListViewModel: ObservableObject {
    
    @Published var presidents: [PresidentsViewModel] = []
    
    func loadPropertyList() {
        guard let path = Bundle.main.path(forResource: "presidents", ofType: "plist"), let xml = FileManager.default.contents(atPath: path) else {
            fatalError("Unable to access property list presidents.plist")
        }
        
        do {
            var presidents = try PropertyListDecoder().decode([USPresident].self, from: xml)
            
            presidents.sort {
                $0.number < $1.number
            }
            
            self.presidents = presidents.map(PresidentsViewModel.init)
        } catch {
            fatalError("Unable to decode property list presidents.plist")
        }
    }
}
