//
//  PresidentDetailView.swift
//  PresidentsListV2
//
//  Created by Jacob Conacher on 11/14/22.
//

import SwiftUI
import Foundation

//Creates the details page for the cells within the list on the main page
struct PresidentDetailView: View {
    
    var president: PresidentsViewModel
    
    //Formats the number in ordinal style (Took me forever to figure this out)
    var numFormatter: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        
        let num = president.number
        
        return formatter.string(from: NSNumber(value: num)) ?? "0"
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Text(president.name)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
            
            Text("\(numFormatter) President of the United States")
                .bold()
            
            Text("(\(president.startDate) to \(president.endDate))")
                .italic()
            
            AsyncImage(url: URL(string: president.url)) { image in
                image.resizable()
                    .scaledToFit()
                    .cornerRadius(16)
            } placeholder: {
                ProgressView()
            }
            .padding(.horizontal)
            
            Text("Nickname")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(president.nickname)
                .font(.title2)

            Text("Political Party")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(president.party)
                .font(.title2)

            Spacer()
        }
    }
}

struct PresidentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PresidentDetailView(president: PresidentsViewModel.default)
    }
}
