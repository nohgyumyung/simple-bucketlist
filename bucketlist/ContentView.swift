//
//  ContentView.swift
//  bucketlist
//
//  Created by 노규명 on 2022/05/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 30) {
                Header()
                BucketListList()
            }
            .customNavigationBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
            .environmentObject(ColorData())
    }
}
