//
//  ShortcutClipboard.swift
//  QuickKeyAssistantApp
//

import AppKit

/// ショートカットのキー表記をクリップボードにコピーする
enum ShortcutClipboard {
    /// 「Copied」を表示しておく秒数
    static let copiedMessageDuration: TimeInterval = 1.2

    static func copy(_ shortcut: Shortcut, to pasteboard: NSPasteboard = .general) {
        pasteboard.clearContents()
        pasteboard.setString(shortcut.keys, forType: .string)
    }
}
