//
//  ProfileHost.swift
//  WorkingWithUIControls_mine
//
//  Created by yl on 2022/3/27.
//

import SwiftUI

struct ProfileHost: View {
    // ?? 如下的注解和语法
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                EditButton()
            }

            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                Text("Profile Editor")
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
