//
//  PresidentsListModelView.swift
//  PresidentsListV2
//
//  Created by Jacob Conacher on 11/14/22.
//

import Foundation

//Grabs the data from the plist file "presidents" and decodes it using the created decoder
class PresidentsListViewModel: ObservableObject {
    
    @Published var presidents: [PresidentsViewModel] = []
    
    func getPresidents() async {
        
        do {
            var presidents = try await WebService().fetchPresidents(url: Constants.Urls.presidentsUrl)
            presidents.sort {
                $0.number < $1.number
            }
            
            self.presidents = presidents.map(PresidentsViewModel.init)
        } catch {
            print(error)
        }
    }
}
