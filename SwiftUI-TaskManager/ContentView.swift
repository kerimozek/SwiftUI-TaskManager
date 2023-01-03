//
//  ContentView.swift
//  SwiftUI-TaskManager
//
//  Created by Mehmet Kerim ÖZEK on 1.01.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
          Home()
                .navigationBarTitle("Task Manager")
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
