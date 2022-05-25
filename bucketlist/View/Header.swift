//
//  Header.swift
//  bucketlist
//
//  Created by 노규명 on 2022/05/11.
//

import SwiftUI

struct Header: View {
    @EnvironmentObject private var colorData: ColorData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("SIMPLE")
            Text("BUCKETLIST.")
        }
        .font(.system(size: 45, weight: .heavy))
        .foregroundColor(colorData.primary.rgbColor)
        .padding(.leading)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
            .environmentObject(ColorData())
            .previewLayout(.sizeThatFits)
    }
}
