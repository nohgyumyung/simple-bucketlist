//
//  bucketlistApp.swift
//  bucketlist
//
//  Created by 노규명 on 2022/05/11.
//

import SwiftUI

@main
struct bucketlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
                .environmentObject(ColorData())
        }
    }
}
