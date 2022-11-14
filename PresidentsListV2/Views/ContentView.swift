//
//  ContentView.swift
//  PresidentsList
//
//  Created by Jacob Conacher on 11/14/22.
//

import SwiftUI

//Displays a List that includes all of the presidents in number order as well as go to their details page when selected
struct ContentView: View {
    
    @StateObject private var presidentListVM = PresidentsListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(presidentListVM.presidents, id: \.name) {
                    presidentVM in
                    NavigationLink(destination: PresidentDetailView(president: presidentVM)) {
                        PresidentCell(president: presidentVM)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("US Presidents")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            presidentListVM.loadPropertyList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
