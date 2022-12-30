//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Don McKenzie on 12/29/22.
//

import SwiftUI


struct ProfileHost: View {
    var draftProfile: Profile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost(draftProfile: Profile.default)
    }
}
