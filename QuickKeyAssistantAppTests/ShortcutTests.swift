//
//  ShortcutTests.swift
//  QuickKeyAssistantAppTests
//

import XCTest
@testable import QuickKeyAssistantApp

final class ShortcutTests: XCTestCase {

    func testSectionsAreNotEmpty() {
        XCTAssertFalse(ToolSection.all.isEmpty)
        for section in ToolSection.all {
            XCTAssertFalse(section.name.trimmingCharacters(in: .whitespaces).isEmpty)
            XCTAssertFalse(section.shortcuts.isEmpty, "\(section.name) has no shortcuts")
        }
    }

    func testShortcutNamesAndKeysAreNotEmpty() {
        for section in ToolSection.all {
            for shortcut in section.shortcuts {
                XCTAssertFalse(shortcut.name.trimmingCharacters(in: .whitespaces).isEmpty, "\(section.name) has a shortcut without a name")
                XCTAssertFalse(shortcut.keys.trimmingCharacters(in: .whitespaces).isEmpty, "\(section.name) / \(shortcut.name) has no keys")
            }
        }
    }

    func testSectionNamesAreUnique() {
        let names = ToolSection.all.map(\.name)
        XCTAssertEqual(names.count, Set(names).count, "Duplicate sections: \(names)")
    }

    func testShortcutNamesAreUniqueInEachSection() {
        for section in ToolSection.all {
            let names = section.shortcuts.map(\.name)
            XCTAssertEqual(names.count, Set(names).count, "Duplicate shortcuts in \(section.name): \(names)")
        }
    }

    func testDocumentURLsAreWebURLs() throws {
        for section in ToolSection.all {
            guard let url = section.documentURL else { continue }
            XCTAssertEqual(url.scheme, "https", "\(section.name): \(url)")
            XCTAssertNotNil(url.host, "\(section.name): \(url)")
        }
    }

    func testSectionsWithDocumentsKeepTheirLinks() {
        XCTAssertEqual(ToolSection.gitHub.documentURL?.absoluteString, "https://docs.github.com/en/get-started/accessibility/keyboard-shortcuts")
        XCTAssertEqual(ToolSection.slack.documentURL?.absoluteString, "https://slack.com/intl/en-gb/help/articles/201374536-Slack-keyboard-shortcuts-and-commands")
    }
}
