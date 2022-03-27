//
//  ProfileHost.swift
//  WorkingWithUIControls_mine
//
//  Created by yl on 2022/3/27.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default

    var body: some View {
        Text("Profile for: \(draftProfile.username)")
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
