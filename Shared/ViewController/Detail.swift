//
//  Detail.swift
//  MPDictionary
//
//  Created by Manh Pham on 19/09/2022.
//

import SwiftUI

struct Detail: View {
    
    var item: Element
        
    var datas: [ElementData] {
        item.items
    }
    
    #if !os(macOS)
    var body: some View {
        main.navigationBarTitleDisplayMode(.automatic)
    }
    #else
    var body: some View {
        main.frame(minWidth: 500, minHeight: 500)
    }
    #endif
    
    
    var main: some View {
        List(datas) { data in
            HStack {
                Text(data.en)
                Spacer()
                Text(data.spell)
                Spacer()
                Text(data.vi)
            }
            .onTapGesture {
                DataSource.speak(text: data.en)
            }
        }
        .navigationTitle(item.id.uppercased())
    }
}
