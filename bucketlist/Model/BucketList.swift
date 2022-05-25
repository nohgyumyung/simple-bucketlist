//
//  BucketList.swift
//  bucketlist
//
//  Created by 노규명 on 2022/05/11.
//

import Foundation

struct BucketList: Identifiable, Hashable {
    let id: String
    var content: String
    var isDone: Bool
}
