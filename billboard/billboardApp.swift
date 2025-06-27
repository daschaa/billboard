//
//  billboardApp.swift
//  billboard
//
//  Created by Weber, Joshua (K-DPXQ/5) on 27.03.24.
//

import SwiftUI

@main
struct billboardApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
        
        var body: some Scene {}
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBar: StatusBarController?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Initialize the status bar
        statusBar = StatusBarController.init()
    }
}
