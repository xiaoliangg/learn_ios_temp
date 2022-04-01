//
//  CategoryHome.swift
//  ComposingComplexInterfaces_mine
//
//  Created by yl on 2022/3/26.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false

    var body: some View {
        NavigationView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                                    .aspectRatio(3 / 2, contentMode: .fit)
                // 将两种地标预览的边缘插图设置为零，以便内容可以扩展到显示的边缘。
                    .listRowInsets(EdgeInsets())

                
                // \.self啥语法??
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())

            }
            .navigationTitle("Featured")
            .listStyle(.inset)
            // 个人资料
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
