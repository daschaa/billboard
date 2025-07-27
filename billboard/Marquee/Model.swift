import Foundation
import SwiftUI

@MainActor @Observable
class Model {
    let scrollSpeed: CGFloat = 30
    let containerWidth: CGFloat = 150
    
    var offset: CGFloat = 0
    var textWidth: CGFloat = 0
    var scrollTask: Task<Void, Never>?
    
    func startScrolling() {
        scrollTask = Task {
            while !Task.isCancelled {
                offset = 0
                try? await Task.sleep(for: .seconds(1))
                
                withAnimation(.linear(duration: textWidth / scrollSpeed)) {
                    offset = -textWidth + containerWidth
                }
                try? await Task.sleep(for: .seconds(textWidth / scrollSpeed + 1.0))
            }
        }
    }
    
    func checkIfNeedsScrolling() {
        if textWidth > containerWidth {
            startScrolling()
        }
    }
}
