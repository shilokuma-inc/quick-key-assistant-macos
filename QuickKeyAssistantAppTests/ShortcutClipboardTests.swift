//
//  ShortcutClipboardTests.swift
//  QuickKeyAssistantAppTests
//

import AppKit
import XCTest
@testable import QuickKeyAssistantApp

final class ShortcutClipboardTests: XCTestCase {

    private var pasteboard: NSPasteboard!

    override func setUp() {
        super.setUp()
        pasteboard = NSPasteboard.withUniqueName()
    }

    override func tearDown() {
        pasteboard.releaseGlobally()
        pasteboard = nil
        super.tearDown()
    }

    func testCopyWritesOnlyKeys() {
        let copied = ShortcutClipboard.copy(Shortcut(name: "Clean", keys: "⌘ ⇧ K"), to: pasteboard)

        XCTAssertTrue(copied)
        XCTAssertEqual(pasteboard.string(forType: .string), "⌘ ⇧ K")
    }

    func testCopyReplacesPreviousContents() {
        pasteboard.clearContents()
        pasteboard.setString("previous", forType: .string)

        ShortcutClipboard.copy(Shortcut(name: "Build", keys: "⌘ B"), to: pasteboard)

        XCTAssertEqual(pasteboard.string(forType: .string), "⌘ B")
        XCTAssertEqual(pasteboard.pasteboardItems?.count, 1)
    }
}
