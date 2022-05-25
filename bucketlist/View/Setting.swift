//
//  Setting.swift
//  bucketlist
//
//  Created by 노규명 on 2022/05/12.
//

import SwiftUI

struct Setting: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject private var colorData: ColorData
    
    var body: some View {
        List {
            Section(content: {
                HStack {
                    Button(action: {
                        colorData.changePrimaryColor(.red)
                    }, label: {
                        Circle()
                            .frame(width: 25, height: 25)
                            .foregroundColor(ColorPalette.red.rgbColor)
                    })
                    Text(ColorPalette.red.colorName)
                    Spacer()
                    Image(systemName: "checkmark")
                        .opacity(colorData.primary == .red ? 1 : 0)
                        .foregroundColor(.primary)
                }
                HStack {
                    Button(action: {
                        colorData.changePrimaryColor(.blue)
                    }, label: {
                        Circle()
                            .frame(width: 25, height: 25)
                            .foregroundColor(ColorPalette.blue.rgbColor)
                    })
                    Text(ColorPalette.blue.colorName)
                    Spacer()
                    Image(systemName: "checkmark")
                        .opacity(colorData.primary == .blue ? 1 : 0)
                        .foregroundColor(.primary)
                }
                HStack {
                    Button(action: {
                        colorData.changePrimaryColor(.yellow)
                    }, label: {
                        Circle()
                            .frame(width: 25, height: 25)
                            .foregroundColor(ColorPalette.yellow.rgbColor)
                    })
                    Text(ColorPalette.yellow.colorName)
                    Spacer()
                    Image(systemName: "checkmark")
                        .opacity(colorData.primary == .yellow ? 1 : 0)
                        .foregroundColor(.primary)
                }
            }, header: {
                Text("COLOR")
            })
            Section(content: {
                HStack{
                    Text("Version")
                    Spacer()
                    Text(getVersion())
                }
            }, header: {
                Text("ABOUT")
            })
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.backward")
                })
            }
        }
        .navigationTitle("Setting")
        .navigationBarBackButtonHidden(true)
        .tint(.primary)
    }
    
    func getVersion() -> String {
        guard let dictionary = Bundle.main.infoDictionary,
              let version = dictionary["CFBundleShortVersionString"] as? String
        else {
            return ""
        }
        return version
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting()
            .environmentObject(ColorData())
    }
}
