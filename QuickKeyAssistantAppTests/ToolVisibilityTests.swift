//
//  ToolVisibilityTests.swift
//  QuickKeyAssistantAppTests
//

import XCTest
@testable import QuickKeyAssistantApp

final class ToolVisibilityTests: XCTestCase {

    func testAllSectionsAreVisibleByDefault() {
        XCTAssertEqual(ToolVisibility.visibleSections(ToolSection.all, hiddenRawValue: ""), ToolSection.all)
    }

    func testHiddenSectionsAreExcludedInOriginalOrder() {
        let rawValue = ToolVisibility.rawValue(from: [ToolSection.simulator.id, ToolSection.slack.id])
        XCTAssertEqual(ToolVisibility.visibleSections(ToolSection.all, hiddenRawValue: rawValue), [.xcode, .gitHub])
    }

    func testAllSectionsCanBeHidden() {
        let rawValue = ToolVisibility.rawValue(from: Set(ToolSection.all.map(\.id)))
        XCTAssertTrue(ToolVisibility.visibleSections(ToolSection.all, hiddenRawValue: rawValue).isEmpty)
    }

    func testRawValueRoundTrips() {
        let ids: Set<ToolSection.ID> = [ToolSection.xcode.id, ToolSection.gitHub.id]
        XCTAssertEqual(ToolVisibility.hiddenIDs(from: ToolVisibility.rawValue(from: ids)), ids)
        XCTAssertEqual(ToolVisibility.hiddenIDs(from: ""), [])
    }

    func testSetHiddenTogglesOnlyTheGivenSection() {
        var rawValue = ToolVisibility.setHidden(true, id: ToolSection.xcode.id, in: "")
        rawValue = ToolVisibility.setHidden(true, id: ToolSection.slack.id, in: rawValue)
        XCTAssertEqual(ToolVisibility.hiddenIDs(from: rawValue), [ToolSection.xcode.id, ToolSection.slack.id])

        rawValue = ToolVisibility.setHidden(false, id: ToolSection.xcode.id, in: rawValue)
        XCTAssertEqual(ToolVisibility.hiddenIDs(from: rawValue), [ToolSection.slack.id])

        rawValue = ToolVisibility.setHidden(false, id: ToolSection.xcode.id, in: rawValue)
        XCTAssertEqual(ToolVisibility.hiddenIDs(from: rawValue), [ToolSection.slack.id])
    }

    func testUnknownHiddenIDsAreIgnored() {
        XCTAssertEqual(ToolVisibility.visibleSections(ToolSection.all, hiddenRawValue: "Unknown"), ToolSection.all)
    }

    func testSectionIDsDoNotContainTheSeparator() {
        for section in ToolSection.all {
            XCTAssertFalse(section.id.contains("\n"), section.id)
        }
    }
}
