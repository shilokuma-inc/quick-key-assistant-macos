//
//  Shortcut.swift
//  QuickKeyAssistantApp
//

import Foundation

struct Shortcut: Hashable {
    let name: String
    let keys: String
}

struct ToolSection: Identifiable, Hashable {
    let name: String
    let shortcuts: [Shortcut]
    let documentURL: URL?

    var id: String { name }
}

extension ToolSection {
    static let xcode = ToolSection(
        name: "Xcode",
        shortcuts: [
            Shortcut(name: "Run", keys: "⌘ R"),
            Shortcut(name: "Test", keys: "⌘ U"),
            Shortcut(name: "Build", keys: "⌘ B"),
            Shortcut(name: "Comment out", keys: "⌘ /"),
            Shortcut(name: "Indentation", keys: "^ I"),
            Shortcut(name: "Rename", keys: "⌘ ^ E"),
        ],
        documentURL: nil
    )

    static let simulator = ToolSection(
        name: "Simulator",
        shortcuts: [
            Shortcut(name: "Screenshot", keys: "⌘ S"),
            Shortcut(name: "Record", keys: "⌘ R"),
            Shortcut(name: "Home", keys: "⌘ ⇧ H"),
            Shortcut(name: "Lock", keys: "⌘ L"),
            Shortcut(name: "Rotate LR", keys: "⌘ ←→"),
            Shortcut(name: "Shake", keys: "⌘ ^ Z"),
            Shortcut(name: "Keyboard I/O", keys: "⌘ K"),
            Shortcut(name: "Input Mac Keyboard", keys: "⌘ ⇧ K"),
        ],
        documentURL: nil
    )

    static let gitHub = ToolSection(
        name: "GitHub",
        shortcuts: [
            Shortcut(name: "Focus SearchBar", keys: "S or /"),
            Shortcut(name: "Notifications", keys: "G N"),
            Shortcut(name: "Command Palette", keys: "⌘ K"),
            Shortcut(name: "Issue Tab", keys: "G I"),
            Shortcut(name: "Pull requests Tab", keys: "G P"),
        ],
        documentURL: URL(string: "https://docs.github.com/en/get-started/accessibility/keyboard-shortcuts")
    )

    static let slack = ToolSection(
        name: "Slack",
        shortcuts: [
            Shortcut(name: "All read", keys: "⇧ esc"),
        ],
        documentURL: URL(string: "https://slack.com/intl/en-gb/help/articles/201374536-Slack-keyboard-shortcuts-and-commands")
    )

    static let all: [ToolSection] = [.xcode, .simulator, .gitHub, .slack]
}

extension ToolSection {
    /// `id` に一致するセクション。見つからなければ先頭のセクションを返す
    static func section(id: ID, in sections: [ToolSection]) -> ToolSection? {
        sections.first { $0.id == id } ?? sections.first
    }
}
