//
//  ModelData.swift
//  bucketlist
//
//  Created by 노규명 on 2022/05/11.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var bucketLists: [BucketList] = [] {
        didSet {
            saveBucketLists()
        }
    }
    @Published var isNewBucketListAdded: Bool = false
    
    init() {
        fetchBucketLists()
    }
    
    func fetchBucketLists() {
        guard let bucketLists = UserDefaults.standard.object(forKey: "bucketLists") as? [[String: Any]] else { return }

        self.bucketLists = bucketLists.compactMap { bucketList in
            guard let id = bucketList["id"] as? String else { return nil }
            guard let content = bucketList["content"] as? String else { return nil }
            guard let isDone = bucketList["isDone"] as? Bool else { return nil }
            return BucketList(id: id, content: content, isDone: isDone)
        }
    }
    
    func saveBucketLists() {
        let bucketLists = self.bucketLists.map { bucketList in
            [
                "id": bucketList.id,
                "content": bucketList.content,
                "isDone": bucketList.isDone
            ]
        }
        
        UserDefaults.standard.set(bucketLists, forKey: "bucketLists")
    }
    
    func addBucketList(_ bucketList: BucketList) {
        self.isNewBucketListAdded = true
        let bucketList = BucketList(id: UUID().uuidString, content: bucketList.content, isDone: bucketList.isDone)
        self.bucketLists.append(bucketList)
    }
    
    func editBucketList(_ bucketList: BucketList) {
        guard let index = self.bucketLists.firstIndex(where: { $0.id == bucketList.id }) else { return }
        self.bucketLists[index] = bucketList
    }
    
    func removeBucketList(_ bucketList: BucketList) {
        self.bucketLists = self.bucketLists.filter { $0.id != bucketList.id }
    }
}
