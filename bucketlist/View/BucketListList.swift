//
//  BucketListList.swift
//  bucketlist
//
//  Created by 노규명 on 2022/05/11.
//

import SwiftUI

struct BucketListList: View {
    @EnvironmentObject private var modelData: ModelData
    
    var body: some View {
        ScrollViewReader { scrollView in
            VStack {
                List {
                    ForEach($modelData.bucketLists) { bucketList in
                        BucketListRow(bucketList: bucketList)
                            .id(bucketList.id)
                    }
                    .listRowSeparator(.hidden)
                    .listSectionSeparator(.hidden)
                }
                .onDisappear {
                    scrollView.scrollTo(
                        modelData.bucketLists.first?.id,
                        anchor: .top
                    )
                }
                .task {
                    if modelData.isNewBucketListAdded {
                        withAnimation {
                            scrollView.scrollTo(
                                modelData.bucketLists.last?.id,
                                anchor: .top
                            )
                        }
                        modelData.isNewBucketListAdded = false
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}

struct BucketListList_Previews: PreviewProvider {
    static var previews: some View {
        BucketListList()
            .environmentObject(ModelData())
            .environmentObject(ColorData())
    }
}
