import Cocoa

class TextInputWindowController: NSWindowController, NSWindowDelegate {
    var textField: NSTextField!
    var submitButton: NSButton!
    var onSubmit: ((String) -> Void)?

    convenience init() {
        self.init(window: NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 300, height: 120),
            styleMask: [.titled, .closable],
            backing: .buffered, defer: false)
        )
        self.window?.center()
        self.window?.title = "Input New Title"
        setupUI()
    }
    
    func showWindow() {
        NSApp.activate(ignoringOtherApps: true)
        self.window?.makeKeyAndOrderFront(nil)
    }

    func setupUI() {
        textField = NSTextField(frame: NSRect(x: 20, y: 70, width: 260, height: 24))
        textField.placeholderString = "Enter text here... (max 50 characters)"
        textField.delegate = self
        window?.contentView?.addSubview(textField)

        let limitLabel = NSTextField(labelWithString: "0/50 characters")
        limitLabel.frame = NSRect(x: 20, y: 50, width: 260, height: 16)
        limitLabel.font = NSFont.systemFont(ofSize: NSFont.smallSystemFontSize)
        limitLabel.textColor = NSColor.secondaryLabelColor
        limitLabel.isEditable = false
        limitLabel.isBezeled = false
        limitLabel.drawsBackground = false
        limitLabel.identifier = NSUserInterfaceItemIdentifier("characterCountLabel")
        limitLabel.stringValue = "\(textField.stringValue.count)/50 characters"
        window?.contentView?.addSubview(limitLabel)
        
        submitButton = NSButton(frame: NSRect(x: 100, y: 20, width: 100, height: 32))
        submitButton.title = "Submit"
        submitButton.target = self
        submitButton.action = #selector(submitText)
        window?.contentView?.addSubview(submitButton)
    }

    @objc func submitText() {
        if let text = textField?.stringValue, !text.isEmpty {
            if text.count <= 50 {
                onSubmit?(text)
                UserDefaults.standard.set(text, forKey: "savedText")
                window?.close()
            } else {
                NSSound.beep()
            }
        }
    }
}

extension TextInputWindowController: NSTextFieldDelegate {
    func control(_ control: NSControl, textShouldChange fieldEditor: NSText, notification: Any) -> Bool {
        guard let textField = control as? NSTextField, textField == self.textField else {
            return true
        }

        guard let replacementString = notification as? String else {
            return true
        }

        let currentText = fieldEditor.string
        let selectedRange = fieldEditor.selectedRange

        let newLength = currentText.count - selectedRange.length + replacementString.count

        return newLength <= 50
    }

    func controlTextDidChange(_ notification: Notification) {
        guard let textField = notification.object as? NSTextField, textField == self.textField else {
            return
        }

        if textField.stringValue.count > 50 {
            textField.stringValue = String(textField.stringValue.prefix(50))
        }

        if let countLabel = window?.contentView?.subviews.first(where: { $0.identifier == NSUserInterfaceItemIdentifier("characterCountLabel") }) as? NSTextField {
            countLabel.stringValue = "\(textField.stringValue.count)/50 characters"
        }
    }
}
