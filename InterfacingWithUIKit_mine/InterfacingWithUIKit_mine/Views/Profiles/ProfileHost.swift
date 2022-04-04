//
//  ProfileHost.swift
//  WorkingWithUIControls_mine
//
//  Created by yl on 2022/3/27.
//

import SwiftUI

struct ProfileHost: View {
    // ?? 如下的注解和语法
    // 1.editMode变量类型是 EnvironmentValues.EditMode类型，可以调用该类型对应的方法,其他例子:    @Environment(\.font) var editMode2
    // 2.此处 editMode属性用来显示编辑视图还是详情视图
    // 3.
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }

            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(ModelData())
    }
}
