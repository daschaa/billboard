import AppKit

class StatusBarController: NSObject {
    private var statusBar: NSStatusBar
    private var statusBarItem: NSStatusItem
    private var menu: NSMenu
    private var textInputWindowController: TextInputWindowController?

    override init() {
        // Initialize the status bar and its item before calling super.init()
       statusBar = NSStatusBar.system
       statusBarItem = statusBar.statusItem(withLength: NSStatusItem.variableLength)
       
       // Initialize the menu
       menu = NSMenu()
        
        super.init()
        
        // Set initial title
        if let button = statusBarItem.button {
            button.title = "Hello"
        }
        
        // Setup menu item for opening the text input window
        let textInputItem = NSMenuItem(title: "Change Title...", action: #selector(showTextInputWindow), keyEquivalent: "")
        textInputItem.target = self
        menu.addItem(textInputItem)

        // Add a separator
        menu.addItem(NSMenuItem.separator())
        
        // Setup menu item for quitting the app
        let quitItem = NSMenuItem(title: "Quit", action: #selector(quitApp), keyEquivalent: "q")
        quitItem.target = self
        menu.addItem(quitItem)
        
        statusBarItem.menu = menu
    }

    @objc func showTextInputWindow() {
        if textInputWindowController == nil {
            textInputWindowController = TextInputWindowController()
            textInputWindowController?.onSubmit = { [weak self] text in
                self?.updateStatusBarItemTitle(with: text)
            }
        }
        textInputWindowController?.showWindow()
    }

    @objc func quitApp() {
        NSApplication.shared.terminate(self)
    }

    private func updateStatusBarItemTitle(with text: String) {
        if let button = statusBarItem.button {
            button.title = text
        }
    }
}
