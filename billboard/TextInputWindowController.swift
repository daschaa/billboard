import Cocoa

class TextInputWindowController: NSWindowController, NSWindowDelegate {
    var textField: NSTextField!
    var submitButton: NSButton!
    var onSubmit: ((String) -> Void)?

    convenience init() {
        self.init(window: NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 300, height: 120),
            styleMask: [.titled, .closable],
            backing: .buffered, defer: false))
        self.window?.center() // Center the window
           self.window?.title = "Input New Title" // Give the window a title
        setupUI()
    }
    
    func showWindow() {
        NSApp.activate(ignoringOtherApps: true) // This line makes the application active
        self.window?.makeKeyAndOrderFront(nil) // This line orders the window to the front
    }

    func setupUI() {
        textField = NSTextField(frame: NSRect(x: 20, y: 50, width: 260, height: 24))
        textField.placeholderString = "Enter text here..."
        window?.contentView?.addSubview(textField)
        
        submitButton = NSButton(frame: NSRect(x: 100, y: 10, width: 100, height: 32))
        submitButton.title = "Submit"
        submitButton.target = self
        submitButton.action = #selector(submitText)
        window?.contentView?.addSubview(submitButton)
    }

    @objc func submitText() {
        if let text = textField?.stringValue, !text.isEmpty {
            onSubmit?(text)
        }
        window?.close()
    }
}
