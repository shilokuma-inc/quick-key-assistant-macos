//
//  Extension+NSImage.swift
//  QuickKeyAssistantApp
//
//  Created by 村石 拓海 on 2024/05/19.
//

import SwiftUI

extension NSImage {
    func resizeImage(named name: String, to newSize: NSSize) -> NSImage? {
      guard let image = NSImage(named: name) else { return nil }
      let resizedImage = NSImage(size: newSize)
      resizedImage.lockFocus()
      image.draw(in: NSRect(origin: .zero, size: newSize))
      resizedImage.unlockFocus()
      return resizedImage
    }
}
