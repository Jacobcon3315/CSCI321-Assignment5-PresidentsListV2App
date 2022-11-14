//
//  PresidentCell.swift
//  PresidentsList
//
//  Created by Jacob Conacher on 11/14/22.
//

import SwiftUI

//Creates a cell to be used within the list on the apps main page
struct PresidentCell: View {
    
    var president: PresidentsViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(president.name)
                    .font(.headline)
                    .fontWeight(.heavy)
                Text(president.party)
                    .font(.subheadline)
            }
        }
    }
}

struct PresidentCell_Previews: PreviewProvider {
    static var previews: some View {
        PresidentCell(president:
            PresidentsViewModel.default)
        .previewLayout(.sizeThatFits)
    }
}
