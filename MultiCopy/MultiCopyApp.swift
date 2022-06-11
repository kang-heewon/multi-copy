//
//  MultiCopyApp.swift
//  MultiCopy
//
//  Created by 오웬 on 2022/06/11.
//

import Cocoa
import SwiftUI

@main
struct kyanApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    // This is our Scene. We are not using Settings
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    static private(set) var instance: AppDelegate!
    var timer: Timer!
    let pasteboard: NSPasteboard = .general
    var lastChangeCount: Int = 0
    
    var statusBar: StatusBarController?
    var clipboard: ClipboardController?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        AppDelegate.instance = self
        
        statusBar = StatusBarController.init()
        clipboard = ClipboardController.init()
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (t) in
            if self.lastChangeCount != self.pasteboard.changeCount {
                self.lastChangeCount = self.pasteboard.changeCount
                NotificationCenter.default.post(name: .NSPasteboardDidChange, object: self.pasteboard)
            }
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        timer.invalidate()
    }
}

extension NSNotification.Name {
    public static let NSPasteboardDidChange: NSNotification.Name = .init(rawValue: "pasteboardDidChangeNotification")
}
