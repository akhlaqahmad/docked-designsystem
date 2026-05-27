import SwiftUI

public struct DSSectionHeader: View {
    let title: String
    let helper: String?

    public init(_ title: String, helper: String? = nil) {
        self.title = title
        self.helper = helper
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title).font(.headline)
            if let helper {
                Text(helper).font(.caption).foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

public struct DSToggleRow: View {
    let title: String
    let helper: String?
    @Binding var isOn: Bool

    public init(_ title: String, helper: String? = nil, isOn: Binding<Bool>) {
        self.title = title
        self.helper = helper
        self._isOn = isOn
    }

    public var body: some View {
        Toggle(isOn: $isOn) {
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                if let helper {
                    Text(helper).font(.caption).foregroundStyle(.secondary)
                }
            }
        }
    }
}

public struct DSEmptyState: View {
    let icon: String
    let title: String
    let message: String
    let actionTitle: String?
    let action: (() -> Void)?

    public init(icon: String, title: String, message: String, actionTitle: String? = nil, action: (() -> Void)? = nil) {
        self.icon = icon
        self.title = title
        self.message = message
        self.actionTitle = actionTitle
        self.action = action
    }

    public var body: some View {
        VStack(spacing: DesignTokens.Spacing.m) {
            Image(systemName: icon)
                .font(.system(size: 36))
                .foregroundStyle(.secondary)
            Text(title).font(.title3.weight(.semibold))
            Text(message)
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            if let actionTitle, let action {
                Button(actionTitle, action: action)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
            }
        }
        .padding(DesignTokens.Spacing.xl)
        .frame(maxWidth: 360)
    }
}
