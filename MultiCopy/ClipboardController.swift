//
//  ClipboardController.swift
//  MultiCopy
//
//  Created by 오웬 on 2022/06/11.
//

import Foundation
import AppKit

class ClipboardController {
    init() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(clipboardChanged), name: .NSPasteboardDidChange, object: nil)
        
        
    }
    
    @objc
    func clipboardChanged(_ notification: Notification){
        guard let pb = notification.object as? NSPasteboard else { return }
        guard let items = pb.pasteboardItems else { return }
        guard let item = items.first?.string(forType: .string) else { return }
        
        print("New item in pasteboard: '\(item)'")
    }
}
