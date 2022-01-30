import Foundation
import Cocoa

var statusBarItem: NSStatusItem = NSStatusBar.system.statusItem(withLength: CGFloat(100))

@objc(AppDelegate)
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  var popover: NSPopover!
  var bridge: RCTBridge!
  @IBOutlet weak var menu: NSMenu?

  var statusBarTitle: String = "billboard" {
      didSet {
        statusBarItem.button?.title = statusBarTitle
      }
  }


  func applicationDidFinishLaunching(_ aNotification: Notification) {
    let jsCodeLocation: URL

    #if DEBUG
      jsCodeLocation = RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackResource:nil)
    #else
      jsCodeLocation = Bundle.main.url(forResource: "main", withExtension: "jsbundle")!
    #endif
    let rootView = RCTRootView(bundleURL: jsCodeLocation, moduleName: "billboard", initialProperties: nil, launchOptions: nil)
    let rootViewController = NSViewController()
    rootViewController.view = rootView

    popover = NSPopover()

    popover.contentSize = NSSize(width: 300, height: 60)
    popover.animates = true
    popover.behavior = .transient
    popover.contentViewController = rootViewController
    
    if let button = statusBarItem.button {
      button.action = #selector(statusBarButtonClicked(_:))
      button.sendAction(on: [.leftMouseUp, .rightMouseUp])
      button.title = "👋 Click me"
    }
  }
  
  @objc func statusBarButtonClicked(_ sender: NSStatusBarButton) {
      let event = NSApp.currentEvent!
      if event.type == NSEvent.EventType.rightMouseUp {
        statusBarItem.menu = menu
        statusBarItem.button?.performClick(nil)
        statusBarItem.menu = nil
      } else {
        togglePopover(sender)
      }
    }

  @objc func togglePopover(_ sender: AnyObject?) {
      if let button = statusBarItem.button {
          if self.popover.isShown {
              self.popover.performClose(sender)
          } else {
              self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)

              self.popover.contentViewController?.view.window?.becomeKey()
          }
      }
  }

  @objc func changeStatusBarTitle(_ text: String) -> Void {
    DispatchQueue.main.async {
      if(!text.isEmpty) {
        self.statusBarTitle = text.emojiUnescapedString
        let size = statusBarItem.button?.sizeThatFits(NSSizeFromString(text))
        statusBarItem.length = NSSizeToCGSize(size!).width
      }
    }
  }
}
