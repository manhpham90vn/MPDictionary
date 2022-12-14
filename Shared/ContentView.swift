//
//  ContentView.swift
//  Shared
//
//  Created by Manh Pham on 19/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    var datas: [Element] {
        return (try? DataSource.getData().elements.sorted { $0.id < $1.id }) ?? []
    }
    
    #if !os(macOS)
    var body: some View {
        main.navigationBarTitleDisplayMode(.inline)
    }
    #else
    var body: some View {
        main.frame(minWidth: 500, minHeight: 500)
    }
    #endif
    
    
    var main: some View {
        NavigationView {
            List(datas) { data in
                NavigationLink {
                    Detail(item: data)
                } label: {
                    Text(data.id.uppercased())
                }
            }
            .navigationTitle("Dictionary")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
