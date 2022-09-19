//
//  Detail.swift
//  MPDictionary
//
//  Created by Manh Pham on 19/09/2022.
//

import SwiftUI

struct Detail: View {
    
    var item: String
    
    var datas: [Element] {
        let data = try? DataSource.getData().element.first { $0.key == item }
        return data?.value.map { Element(id: $0.key, text: $0.value) }.sorted { $0.id < $1.id } ?? []
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
                Text(data.id)
                Spacer()
                Text(data.text)
            }
        }
        .navigationTitle(item.uppercased())
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(item: "a")
    }
}

