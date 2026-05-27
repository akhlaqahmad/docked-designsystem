import SwiftUI

public enum DesignTokens {
    public enum Spacing {
        public static let xs: CGFloat = 4
        public static let s: CGFloat = 8
        public static let m: CGFloat = 12
        public static let l: CGFloat = 16
        public static let xl: CGFloat = 24
        public static let xxl: CGFloat = 32
    }

    public enum Radius {
        public static let small: CGFloat = 6
        public static let medium: CGFloat = 10
        public static let large: CGFloat = 16
        public static let pill: CGFloat = 999
    }

    public enum Duration {
        public static let micro: TimeInterval = 0.12
        public static let standard: TimeInterval = 0.18
        public static let slow: TimeInterval = 0.32
    }

    public enum Elevation {
        public static let dock: CGFloat = 24
        public static let inspector: CGFloat = 12
        public static let toast: CGFloat = 8
    }
}

public extension Color {
    /// Initialize from a hex string. Supports `#RGB`, `#RGBA`, `#RRGGBB`, `#RRGGBBAA`,
    /// or no leading `#`.
    init?(hexARGB hex: String) {
        var s = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if s.hasPrefix("#") { s.removeFirst() }

        var r: Double = 0, g: Double = 0, b: Double = 0, a: Double = 1
        guard let v = UInt64(s, radix: 16) else { return nil }

        switch s.count {
        case 3:
            r = Double((v >> 8) & 0xF) / 15.0
            g = Double((v >> 4) & 0xF) / 15.0
            b = Double(v & 0xF) / 15.0
        case 4:
            r = Double((v >> 12) & 0xF) / 15.0
            g = Double((v >> 8) & 0xF) / 15.0
            b = Double((v >> 4) & 0xF) / 15.0
            a = Double(v & 0xF) / 15.0
        case 6:
            r = Double((v >> 16) & 0xFF) / 255.0
            g = Double((v >> 8) & 0xFF) / 255.0
            b = Double(v & 0xFF) / 255.0
        case 8:
            r = Double((v >> 24) & 0xFF) / 255.0
            g = Double((v >> 16) & 0xFF) / 255.0
            b = Double((v >> 8) & 0xFF) / 255.0
            a = Double(v & 0xFF) / 255.0
        default:
            return nil
        }
        self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
}
