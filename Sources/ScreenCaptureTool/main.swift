import ScreenCaptureKit
import Foundation

print("Hello, world!")

// Add logging to check if ScreenCaptureKit is available
if #available(macOS 12.3, *) {
    print("ScreenCaptureKit is available (macOS 12.3+ required)")
    print("Available SCShareableContent methods: \(SCShareableContent.self)")
    
    // Log the process info
    let currentProcess = ProcessInfo.processInfo
    print("Process Name: \(currentProcess.processName)")
    print("Process ID: \(currentProcess.processIdentifier)")
    
    // Attempt to get the available content
    SCShareableContent.getCurrent { (content, error) in
        if let error = error {
            print("Error getting shareable content: \(error)")
        } else {
            print("Successfully retrieved shareable content.")
            if let content = content {
                print("Number of windows: \(content.windows.count)")
                print("Number of displays: \(content.displays.count)")
            }
        }
    }
    
} else {
    print("ScreenCaptureKit is not available on this macOS version.")
}

// Keep the program running to allow asynchronous operations to complete
RunLoop.main.run(until: Date(timeIntervalSinceNow: 5))
