import Foundation
import AVFoundation

func setFlash(on: Bool? = nil) {
    guard let device = AVCaptureDevice.default(for: .video) else { return }
    
    if device.hasTorch {
        do {
            try device.lockForConfiguration()
            
            if let on = on {
                if on {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
            } else {
                device.torchMode = .auto
            }
            
            device.unlockForConfiguration()
        } catch {
            print("Flash could not be used")
        }
    } else {
        print("Flash is not available")
    }
}
