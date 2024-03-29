import AppKit

class StatusBarController: NSObject {
    private var statusBar: NSStatusBar
    private var statusBarItem: NSStatusItem
    private var menu: NSMenu
    private var textInputWindowController: TextInputWindowController?

    fileprivate func addQuitMenuItem() {
        let quitItem = NSMenuItem(title: "Quit", action: #selector(quitApp), keyEquivalent: "q")
        quitItem.target = self
        menu.addItem(quitItem)
    }
    
    fileprivate func loadInitialText() {
        let savedText = UserDefaults.standard.string(forKey: "savedText") ?? "Hello"
        updateStatusBarItemTitle(with: savedText)
    }
    
    fileprivate func addChangeTitleMenuItem() {
        let textInputItem = NSMenuItem(title: "Change Title...", action: #selector(showTextInputWindow), keyEquivalent: "")
        textInputItem.target = self
        menu.addItem(textInputItem)
    }
    
    override init() {
        statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(withLength: NSStatusItem.variableLength)
        menu = NSMenu()
        
        super.init()
        
        loadInitialText()
        
        addChangeTitleMenuItem()

        menu.addItem(NSMenuItem.separator())
        
        addQuitMenuItem()
        
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
