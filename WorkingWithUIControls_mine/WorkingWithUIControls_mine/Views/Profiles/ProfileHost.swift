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
    // 3.初始时,editMode?.wrappedValue为inactive状态
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        // 1. 点击cancel后执行的代码。draftProfile 保存页面的更新值,modelData.profile是修改前的值
                        // 理解:如果cancel，那就将draftProfile回退为初始值;否则draftProfile为更新值。而不管是否因为cancel退出，最终下方的 onDisappear()方法都会用 draftProfile 更新 modelData
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                // 作用:
                // 1.用来改变@Environment(\.editMode)
                // 2.自动切换显示 "Edit" 或 "Done"
                EditButton()
            }

            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        // 进入编辑模式执行的代码
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        // 退出编辑模式执行的代码
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
