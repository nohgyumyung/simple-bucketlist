//
//  EditBucketList.swift
//  bucketlist
//
//  Created by 노규명 on 2022/05/11.
//

import SwiftUI

struct EditBucketList: View {
    enum EditState {
        case new
        case edit
        
        var title: String {
            switch self {
            case .new:
                return "New"
            case .edit:
                return "Edit"
            }
        }
    }
    
    enum Field: Hashable {
        case bucketListField
    }
    
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject private var modelData: ModelData
    @EnvironmentObject private var colorData: ColorData
    @State private var textEditorHeight: CGFloat = 16
    @FocusState private var focusedField: Field?
    @State var bucketList: BucketList
    let editState: EditState 
    
    var body: some View {
        ZStack {
            Color.clear
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    focusedField = nil
                }
            VStack(alignment: .center, spacing: 0) {
                Spacer().frame(height: 30)
                ZStack(alignment: .leading) {
                    if bucketList.content.isEmpty {
                        Text("Write your bucketlist here.")
                            .font(.custom("NotoSansKR-Light", size: 16))
                            .foregroundColor(Color.gray)
                            .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0))
                    }
                    Text(bucketList.content)
                        .font(.custom("NotoSansKR-Light", size: 16))
                        .padding(.leading, 7)
                        .background(GeometryReader {
                            Color.clear.preference(
                                key: ViewHeightKey.self,
                                value: $0.frame(in: .local).size.height
                            )
                        })
                    TextEditor(text: $bucketList.content)
                        .focused($focusedField, equals: .bucketListField)
                        .font(.custom("NotoSansKR-Light", size: 16))
                        .frame(height: max(40, textEditorHeight))
                        .opacity(bucketList.content.isEmpty ? 0.5 : 1)
                }.onPreferenceChange(ViewHeightKey.self) { textEditorHeight = $0 }
                Divider()
                Spacer().frame(height: 30)
                Button(action: {
                    switch editState {
                    case .new:
                        modelData.addBucketList(bucketList)
                    case .edit:
                        modelData.editBucketList(bucketList)
                    }
                    self.presentation.wrappedValue.dismiss()
                }, label: {
                    bucketList.content.isEmpty ?
                    Text("DONE")
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .font(.custom("NotoSansKR-Regular", size: 16))
                        .foregroundColor(colorData.secondary.rgbColor)
                        .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.gray.opacity(0.5)))
                    :
                    Text("DONE")
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .font(.custom("NotoSansKR-Regular", size: 16))
                        .foregroundColor(colorData.secondary.rgbColor)
                        .background(RoundedRectangle(cornerRadius: 5).foregroundColor(colorData.primary.rgbColor))
                })
                .disabled(bucketList.content.isEmpty)
                Spacer()
            }
            .padding()
            .navigationTitle(editState.title)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.backward")
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        modelData.removeBucketList(bucketList)
                        self.presentation.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "trash")
                    })
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .tint(.primary)
    }
}

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 16 }
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = value + nextValue()
    }
}

struct EditBucketList_Previews: PreviewProvider {
    static let bucketList0 = BucketList(
        id: UUID().uuidString,
        content: "",
        isDone: false
    )
    
    static var previews: some View {
        EditBucketList(bucketList: bucketList0, editState: .new)
            .environmentObject(ModelData())
            .environmentObject(ColorData())
    }
}
