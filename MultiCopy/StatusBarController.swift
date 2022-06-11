//
//  StatusBarController.swift
//  MultiCopy
//
//  Created by 오웬 on 2022/06/11.
//

import Foundation
import AppKit

class StatusBarController {
    private var statusBar: NSStatusBar
    private var statusItem: NSStatusItem
    
    init() {
        statusBar = NSStatusBar.init()
        
        statusItem = statusBar.statusItem(withLength: 30.0)
        
        if let statusBarButton = statusItem.button {
            statusBarButton.image = #imageLiteral(resourceName: "logo")
            statusBarButton.image?.size = NSSize(width: 18.0, height: 18.0)
            statusBarButton.image?.isTemplate = true
        }
    }
}
