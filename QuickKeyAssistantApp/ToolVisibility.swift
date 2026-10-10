//
//  ToolVisibility.swift
//  QuickKeyAssistantApp
//

import Foundation

/// 設定画面でオフにしたツールを `UserDefaults` に保存する形と、表示するツールの絞り込み
enum ToolVisibility {
    static let storageKey = "hiddenToolSectionIDs"

    private static let separator: Character = "\n"

    static func hiddenIDs(from rawValue: String) -> Set<ToolSection.ID> {
        Set(rawValue.split(separator: separator).map(String.init))
    }

    static func rawValue(from hiddenIDs: Set<ToolSection.ID>) -> String {
        hiddenIDs.sorted().joined(separator: String(separator))
    }

    static func visibleSections(_ sections: [ToolSection], hiddenRawValue: String) -> [ToolSection] {
        let hiddenIDs = hiddenIDs(from: hiddenRawValue)
        return sections.filter { !hiddenIDs.contains($0.id) }
    }

    static func setHidden(_ isHidden: Bool, id: ToolSection.ID, in rawValue: String) -> String {
        var hiddenIDs = hiddenIDs(from: rawValue)
        if isHidden {
            hiddenIDs.insert(id)
        } else {
            hiddenIDs.remove(id)
        }
        return self.rawValue(from: hiddenIDs)
    }
}
