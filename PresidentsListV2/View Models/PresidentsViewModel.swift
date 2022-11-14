//
//  PresidentsViewModel.swift
//  PresidentsList
//
//  Created by Jacob Conacher on 11/14/22.
//

import Foundation

//Creates a struct to be used within the program to display certain parts from the plist file
struct PresidentsViewModel {
    var president: USPresident
    
    var name: String {
        return president.name
    }
    
    var number: Int {
        return president.number
    }
    
    var startDate: String {
        return president.startDate
    }
    
    var endDate: String {
        return president.endDate
    }
    
    var nickname: String {
        return president.nickname
    }
    
    var party: String {
        return president.party
    }
    
    static var `default`: PresidentsViewModel {
        let president = USPresident(name: "Andrew Jackson", number: 7, startDate: "March 4, 1829", endDate: "March 3, 1837", nickname: "\"Old Hickory\"", party: "Democrat")
        return PresidentsViewModel(president: president)
    }
}
