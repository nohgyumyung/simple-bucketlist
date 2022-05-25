//
//  BucketListRow.swift
//  bucketlist
//
//  Created by 노규명 on 2022/05/11.
//

import SwiftUI

struct BucketListRow: View {
    @EnvironmentObject private var colorData: ColorData
    @Binding var bucketList: BucketList
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Button(action: {
                bucketList.isDone.toggle()
            }, label: {
                bucketList.isDone ?
                Image(systemName: "checkmark.square.fill")
                    .resizable()
                    .frame(width: 21, height: 21)
                    .foregroundColor(colorData.secondary.rgbColor)
                :
                Image(systemName: "square")
                    .resizable()
                    .frame(width: 21, height: 21)
                    .foregroundColor(colorData.secondary.rgbColor)
            })
                .buttonStyle(.plain)
            Text(bucketList.content)
                .font(.custom("NotoSansKR-Light", size: 16))
                .foregroundColor(colorData.secondary.rgbColor)
                .background(NavigationLink(destination: EditBucketList(bucketList: bucketList, editState: .edit)) {}.opacity(0))
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 5)
            .foregroundColor(colorData.primary.rgbColor))
    }
}

struct BucketListRow_Previews: PreviewProvider {
    static let bucketList0 = BucketList(
        id: UUID().uuidString,
        content: "제주도 여행",
        isDone: false
    )
    
    static var previews: some View {
        BucketListRow(bucketList: .constant(bucketList0))
            .environmentObject(ColorData())
            .previewLayout(.fixed(width: 380, height: 70))
    }
}
