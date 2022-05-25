//
//  CustomNavigationBar.swift
//  bucketlist
//
//  Created by 노규명 on 2022/05/12.
//

import SwiftUI

struct CustomNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .toolbar {
                HStack {
                    NavigationLink(destination: {
                        let bucketList = BucketList(
                            id: UUID().uuidString,
                            content: "",
                            isDone: false
                        )
                        EditBucketList(bucketList: bucketList, editState: .new)
                    }, label: {
                        Image(systemName: "plus")
                    })
                    NavigationLink(destination: {
                        Setting()
                    }, label: {
                        Image(systemName: "gearshape")
                    })
                }
            }
            .foregroundColor(.primary)
            .navigationBarTitleDisplayMode(.inline)
    }
}

extension View {
    func customNavigationBar() -> some View {
        return self.modifier(CustomNavigationBar())
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Color.white.edgesIgnoringSafeArea(.all)
                .customNavigationBar()
        }
    }
}
