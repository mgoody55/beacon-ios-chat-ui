//
//  Created by Alex.M on 08.07.2022.
//

import SwiftUI

struct MessageTimeView: View {

    let text: String
    let userType: UserType
    var chatTheme: ChatTheme
    let transport: String?

    var displayText: String {
        if let transport = transport {
            return "\(text) via \(transport)"
        }
        return text
    }

    var body: some View {
        Text(displayText)
            .font(.caption)
            .foregroundColor(chatTheme.colors.messageTimeText(userType))
    }
}

struct MessageTimeWithCapsuleView: View {

    let text: String
    let isCurrentUser: Bool
    var chatTheme: ChatTheme
    let transport: String?

    var displayText: String {
        if let transport = transport {
            return "\(text) via \(transport)"
        }
        return text
    }

    var body: some View {
        Text(displayText)
            .font(.caption)
            .foregroundColor(.white)
            .opacity(0.8)
            .padding(.top, 4)
            .padding(.bottom, 4)
            .padding(.horizontal, 8)
            .background {
                Capsule()
                    .foregroundColor(.black.opacity(0.4))
            }
    }
}

