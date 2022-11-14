//
//  WebService.swift
//  PresidentsListV2
//
//  Created by Jacob Conacher on 11/14/22.
//

import Foundation

class WebService {
    
    func fetchPresidents(url: URL?) async throws -> [USPresident] {
        
        guard let url = url else {
            return []
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let presidents = try? JSONDecoder().decode([USPresident].self, from: data)
        
        return presidents ?? []
    }
}

